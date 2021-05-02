//
//  GTSplashView.m
//  SimpleApp
//
//  Created by 申凡 on 2021/5/2.
//

#import "GTSplashView.h"
#import "GTScreen.h"

@interface GTSplashView()
@property (nonatomic,strong,readwrite) UIButton *button;

@end

@implementation GTSplashView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.image = [UIImage imageNamed:@"icon.bundle/Launch.png"];
        [self addSubview:({
            _button = [[UIButton alloc]initWithFrame:UIRect(330, 100, 60, 40)];
            _button.backgroundColor = [UIColor lightGrayColor];
            [_button setTitle:@"跳过" forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
            _button;
            
        })];
        //需要设置允许点击
        self.userInteractionEnabled = YES;
        
    }
    return self;
}


#pragma  mark -
-(void)_removeSplashView{
    //第一种方式，直接把view移除
    [self removeFromSuperview];
}
@end
