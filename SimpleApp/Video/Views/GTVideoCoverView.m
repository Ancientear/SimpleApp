//
//  GTVideoCoverView.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/15.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface GTVideoCoverView()
@property(nonatomic,strong,readwrite)AVPlayerItem *videoItem;
@property(nonatomic,strong,readwrite)AVPlayer *avPlayer;
@property(nonatomic,strong,readwrite)AVPlayerLayer *playerLayer;

@property(nonatomic,strong,readwrite)UIImageView *coverView;
@property(nonatomic,strong,readwrite)UIImageView *playButton;
@property(nonatomic,copy,readwrite) NSString *videoUrl;

@end

@implementation GTVideoCoverView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _coverView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height)];
            _coverView;
        })];
        [_coverView addSubview:({
            _playButton = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2,(frame.size.height - 50)/2,50,50)];
            _playButton;
        })];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
        [self addGestureRecognizer:tapGesture];
        
        //注册一个单例的监听事件,广播这个事件的时候就会执行_handlePlayEnd这个事件
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

//对于NSNotification来说，注册的是一个单例的中心化管理，生命周期是整个app的周期，所以在类销毁的时候，要把自己从这个单例中移除
-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //也需要将status监听移除
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}

#pragma mark -public method
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl{
    _coverView.image = [UIImage imageNamed:videoCoverUrl];
    _playButton.image = [UIImage imageNamed:@"icons8-kawaii-croissant-50.png"];
    _videoUrl = videoUrl;
}


#pragma mark - private public
//视频播放的业务逻辑，首先是有一个占位图，占位图上有一个视频播放的按钮，当点击播放的时候，视频的界面粘贴到全部的界面上来
- (void)_tapToPlay{
    
    NSURL *videoURL = [NSURL URLWithString:_videoUrl];
    
    AVAsset *asset = [AVAsset assetWithURL:videoURL];

    //AVPlayerItem里面好多通知
    _videoItem = [AVPlayerItem playerItemWithAsset:asset];
    //完成self对_videoItem一个属性的监听
    [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //缓冲进度
    [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    //时长
    CMTime duration = _videoItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
    
    //playLayer只提供画面的展示，不会响应手势
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
    //调整大小
    _playerLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:_playerLayer];
    
    //播放器的播放
    [_avPlayer play];
    NSLog(@"");
    
}


-(void)_handlePlayEnd{
    [_playerLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;
}

#pragma  mark - KVO
//添加一个status变化的操作
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    //首先判断监听的keyPath想是不是status
    if ([keyPath isEqualToString:@"status"]) {
        //将id类型转为number
        if(((NSNumber *)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay){
             [_avPlayer play];
        }else{
            NSLog(@"");
        }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"缓冲：%@",[change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
