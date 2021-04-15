//
//  GTVideoPlayer.h
//  SimpleApp
//
//  Created by 申凡 on 2021/4/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GTVideoPlayer : NSObject

//播放器是一个单例
+ (GTVideoPlayer *)Player;
//播放器提供一个通过url播放视频的接口,还要贴到对应的view上
- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *) attachView;

@end

NS_ASSUME_NONNULL_END
