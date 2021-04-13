//
//  GTNormalTableViewCell.h
//  SimpleApp
//
//  Created by 申凡 on 2021/4/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GTListItem;
//点击删除按钮
@protocol GTNormalTableViewCellDelegate <NSObject>
//通过这些步骤，将整个UIView上点击按钮的这样一个操作，反馈到了整个的UIViewController中。
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end
//新闻列表cell
@interface GTNormalTableViewCell : UITableViewCell

//自己实现一个delegate
@property(nonatomic,weak,readwrite) id<GTNormalTableViewCellDelegate>delegate;

- (void) layoutTableViewCellWithItem:(GTListItem *)item;
@end

NS_ASSUME_NONNULL_END
