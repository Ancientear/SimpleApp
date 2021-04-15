//
//  GTVideoCoverView.h
//  SimpleApp
//
//  Created by 申凡 on 2021/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTVideoCoverView : UICollectionViewCell
- (void)layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
