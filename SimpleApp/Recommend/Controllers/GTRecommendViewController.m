//
//  GTRecommendViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/12.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

- (instancetype) init {
	self = [super init];
	if(self) {
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
	scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5,self.view.bounds.size.height);

	scrollView.delegate = self;
	//不显示滚动条
	scrollView.showsHorizontalScrollIndicator = NO;

	//翻页设置颜色
	NSArray *colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor grayColor],[UIColor purpleColor],[UIColor systemPinkColor]];

	for(int i = 0; i < 5; i++) {
		[scrollView addSubview:({
			UIView *view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];


			//自定义一个View按钮
			[view addSubview:({
				UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
				view.backgroundColor = [UIColor yellowColor];
				UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
				tapGesture.delegate = self;
				[view addGestureRecognizer:tapGesture];
				view;
			})];
            
            
			view.backgroundColor = [colorArray objectAtIndex:i];    //使用数组给view添加颜色
			view;
		})];
	}

	//显示翻页的效果
	scrollView.pagingEnabled = YES;
	[self.view addSubview: scrollView];

}

//是否需要显示手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
	return YES;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	NSLog(@"scrollViewDidScroll %@",@(scrollView.contentOffset.y));
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0)){
	//NSLog(@"scrollViewDidScroll %@",@(scrollView.contentOffset.y));
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	NSLog(@"scrollViewDidEndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
	NSLog(@"scrollViewDidEndDragging");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	NSLog(@"scrollViewDidEndDragging");
}

//有的话直接跳转，无的话跳转到商店或者是h5页面
- (void)viewClick {
    NSURL *urlScheme = [NSURL URLWithString:@"testScheme://"];
    BOOL canOpenURL = [[UIApplication sharedApplication] canOpenURL:urlScheme];
    
    [[UIApplication sharedApplication] openURL:urlScheme options:nil completionHandler:^(BOOL success){
            NSLog(@"");
    }];
}
@end

/*
   UIScrollViewDelegate
   滚动：监听页面滚动，以及根据Offset做业务逻辑，scrollViewDidScroll
   拖拽：中断一些业务逻辑，如视频/gif播放，scrollViewWillEndDragging
   减速：页面停止时开始逻辑，如视频自动播放，scrollViewWillBeginDecelerating
 */
