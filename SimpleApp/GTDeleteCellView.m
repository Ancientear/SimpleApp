//
//  GTDeleteCellView.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/12.
//

#import "GTDeleteCellView.h"


@interface GTDeleteCellView()
//声明两个子View
@property(nonatomic,strong,readwrite) UIView *backgroundView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;
@end

@implementation GTDeleteCellView

//初始化的时候实例化两个view
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:({
            _backgroundView = [[UIView alloc]initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
            
            //点击灰色浮层也可以使浮层结束展示
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissDeleteView)];
                tapGesture;
            })];
            _backgroundView;
        })];
        
        
        [self addSubview:({
            _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

- (void) showDeleteView{
    //显示到所有的view上
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
- (void) dismissDeleteView{
    [self removeFromSuperview];
}
- (void) _clickButton{
    [self removeFromSuperview];
}
@end
