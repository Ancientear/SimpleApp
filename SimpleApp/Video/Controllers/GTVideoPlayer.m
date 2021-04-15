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
@property (nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property (nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property (nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@end
@implementation GTVideoPlayer

+ (GTVideoPlayer *)Player {
    static GTVideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[GTVideoPlayer alloc] init];
    });
    return player;
}


- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attachView {

    //首先停止播放
    [self _stopPlay];

    NSURL *videoURL = [NSURL URLWithString:videoUrl];
    AVAsset *asset = [AVAsset assetWithURL:videoURL];
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];

    //监听视频资源状态
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];

    //监听视频缓冲进度
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];

    //需要在状态变化后获取时间
    CMTime duration = _videoItem.duration;
    __unused CGFloat videoDuration = CMTimeGetSeconds(duration);

    //创建播放器
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];

    //监听播放器播放进度
    [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
         NSLog(@"播放进度：%@", @(CMTimeGetSeconds(time)));
     }];

    //展示playerLayer
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    _playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:_playerLayer];

    //接收播放完成Notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}


#pragma mark - private public
//视频播放的业务逻辑，首先是有一个占位图，占位图上有一个视频播放的按钮，当点击播放的时候，视频的界面粘贴到全部的界面上来
- (void)_stopPlay {
    //对于NSNotification来说，注册的是一个单例的中心化管理，生命周期是整个app的周期，所以在类销毁的时候，要把自己从这个单例中移除
    
    //移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];

    //销毁播放器
    [_playerLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;

}


- (void)_handlePlayEnd {
    //播放完成后循环播放
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {

    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            //在合适的时机开始播放
            [_avPlayer play];
        } else {
            //监控错误
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        //缓冲进度监听
        NSLog(@"缓冲：%@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
