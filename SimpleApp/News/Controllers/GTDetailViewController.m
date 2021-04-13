//
//  GTDetailViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/12.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *webView;
@property(nonatomic,strong,readwrite) UIProgressView *progressView;
@property(nonatomic,copy,readwrite) NSString *articleUrl;
@end

@implementation GTDetailViewController
//有了监听回调，还需要有移除监听
- (void) dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

-(instancetype) initWithUrlString:(NSString *)urlString{
    self = [super self];
    if (self) {
        self.articleUrl = urlString;
    }
    return  self;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view addSubview:({
		self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height )];
		self.webView.navigationDelegate = self;
		self.webView;
	})];

	//进度条样式
	[self.view addSubview:({
		self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
		self.progressView;
	})];

	//网站链接
	[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];

	//增加一个监听.forKeyPath即监听某个属性，监听之后需要加入回调,estimatedProgress是否页面加载完成
	[self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}


//页面已经加载完毕需要实现的业务逻辑
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
	NSLog(@"didFinishNavigation");
}


//在对estimatedProgress监听后需要加入回调
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
	self.progressView.progress = self.webView.estimatedProgress;
	NSLog(@"observeValueForKeyPath");

}


/*
   使用WKWebView流程
   1、创建WKWebView
   2、创建Delegate以及样式，JS注入等
   3、加载URL或HTML字符串
   4、在相应的回调中处理业务逻辑
 */

@end
