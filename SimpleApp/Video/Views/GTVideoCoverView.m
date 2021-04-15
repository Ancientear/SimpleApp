//
//  GTVideoCoverView.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/15.
//

#import "GTVideoCoverView.h"
#import <AVFoundation/AVFoundation.h>

@interface GTVideoCoverView()
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
    }
    return self;
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
    
//    AVAsset *asset = [AVAsset assetWithURL:videoURL];
//
//    AVPlayerItem *videoItem = [AVPlayerItem playerItemWithAsset:asset];
    
    //AVPlayer *avPlayer = [AVPlayer playerWithPlayerItem:videoItem];
    
    //_videoUrl也可以直接生成avPlayer
    AVPlayer *avPlayer = [AVPlayer playerWithURL:videoURL];
    
    //playLayer只提供画面的展示，不会响应手势
    AVPlayerLayer *playLayer = [AVPlayerLayer playerLayerWithPlayer:avPlayer];
    
    //调整大小
    playLayer.frame = _coverView.bounds;
    [_coverView.layer addSublayer:playLayer];
    
    //播放器的播放
    [avPlayer play];
    NSLog(@"");
    
}
@end
