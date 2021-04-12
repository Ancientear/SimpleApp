//
//  GTRecommendViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/12.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate>

@end

@implementation GTRecommendViewController

- (instancetype) init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icons8-pentagram-devil-50.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icons8-kawaii-broccoli-50.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    //不设置则代表的是普通的UIView
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5,self.view.bounds.size.height);
    
    scrollView.delegate = self;
    //不显示滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //翻页设置颜色
    NSArray *colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor purpleColor],[UIColor systemPinkColor]];
    
    for(int i = 0 ; i < 5 ; i++){
        [scrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            view.backgroundColor = [colorArray objectAtIndex:i];//使用数组给view添加颜色
            view;
        })];
    }
    
    
    
    
    //显示翻页的效果
    //scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll %@",@(scrollView.contentOffset.y));
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0)){
    //NSLog(@"scrollViewDidScroll %@",@(scrollView.contentOffset.y));
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDragging");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDragging");
}
@end

/*
 UIScrollViewDelegate
 滚动：监听页面滚动，以及根据Offset做业务逻辑，scrollViewDidScroll
 拖拽：中断一些业务逻辑，如视频/gif播放，scrollViewWillEndDragging
 减速：页面停止时开始逻辑，如视频自动播放，scrollViewWillBeginDecelerating
 */
