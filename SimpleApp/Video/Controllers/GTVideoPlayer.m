//
//  GTVideoPlayer.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/15.
//

#import "GTVideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

//将播放的逻辑全部迁移到播放器中来
@interface GTVideoPlayer ()
@property(nonatomic,strong,readwrite) AVPlayerItem *videoItem;
@property(nonatomic,strong,readwrite) AVPlayer *avPlayer;
@property(nonatomic,strong,readwrite) AVPlayerLayer *playerLayer;

@end
@implementation GTVideoPlayer

+ (GTVideoPlayer *)Player{
    static GTVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}


- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *) attachView {
    //销毁之前的播放器，再启动新的
    [self _stopPlay];
    
	NSURL *videoURL = [NSURL URLWithString:videoUrl];

	AVAsset *asset = [AVAsset assetWithURL:videoURL];

	_videoItem = [AVPlayerItem playerItemWithAsset:asset];
	[_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
	[_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];

	CMTime duration = _videoItem.duration;
	CGFloat videoDuration = CMTimeGetSeconds(duration);

	_avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
	[_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
	         NSLog(@"播放进度:%@",@(CMTimeGetSeconds(time)));
	 }];

	//playLayer只提供画面的展示，不会响应手势
	_playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
	_playerLayer.frame = attachView.bounds;
	[attachView.layer addSublayer:_playerLayer];

    //注册一个单例的监听事件,广播这个事件的时候就会执行_handlePlayEnd这个事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

	NSLog(@"");
}


#pragma mark - private public
//视频播放的业务逻辑，首先是有一个占位图，占位图上有一个视频播放的按钮，当点击播放的时候，视频的界面粘贴到全部的界面上来
- (void)_stopPlay {
    //对于NSNotification来说，注册的是一个单例的中心化管理，生命周期是整个app的周期，所以在类销毁的时候，要把自己从这个单例中移除
    [[NSNotificationCenter defaultCenter] removeObserver:self];

	[_playerLayer removeFromSuperlayer];
    
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
	_videoItem = nil;
	_avPlayer = nil;

}


-(void)_handlePlayEnd {
	[_avPlayer seekToTime:CMTimeMake(0,1)];
    [_avPlayer play];
}

#pragma mark - KVO
//添加一个status变化的操作
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
	//首先判断监听的keyPath想是不是status
	if ([keyPath isEqualToString:@"status"]) {
		//将id类型转为number
		if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
			[_avPlayer play];
		}else{
			NSLog(@"");
		}
	}else if([keyPath isEqualToString:@"loadedTimeRanges"]) {
		NSLog(@"缓冲：%@",[change objectForKey:NSKeyValueChangeNewKey]);
	}
}
@end
