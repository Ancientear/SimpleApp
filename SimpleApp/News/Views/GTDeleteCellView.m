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
@property(nonatomic,strong,readwrite)dispatch_block_t deleteBlock;
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
            _deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor blueColor];
            _deleteButton;
        })];
    }
    return self;
}

//扩展点击的函数
- (void) showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    
    _deleteBlock = [clickBlock copy];//点击的时候持有这个Block
    //显示到所有的view上
    [[UIApplication sharedApplication].keyWindow addSubview:self];
   
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
            self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
        } completion:^(BOOL finished) {
            NSLog(@"");
        }];
}
- (void) dismissDeleteView{
    [self removeFromSuperview];
}
- (void) _clickButton{
    if(_deleteBlock){
        _deleteBlock();
    }
    [self removeFromSuperview];
}

@end
