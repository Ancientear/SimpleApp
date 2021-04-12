//
//  ViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/8.
//

#import "ViewController.h"

@interface TestView : UIView
@end


@implementation  TestView


- (instancetype)init{
    self = [super init];
    if(self){
    }
    return self;
}

//测试UIView的生命周期
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
    
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow :newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
}

@end

@interface ViewController() <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    //触发方法
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

//高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
//点击触发的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller = [[UIViewController alloc]init];
    controller.title = [NSString stringWithFormat:@"%@" , @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
    
}


//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

//测试tableview的回收池
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //去回收池中取，如果取到了直接用，没有的话再声明一个cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    //cell.textLabel.text = @"主标题";
    cell.textLabel.text = [NSString stringWithFormat:@"主标题 - %@",@(indexPath.row)];
    cell.detailTextLabel.text = @"副标题";
    cell.imageView.image = [UIImage imageNamed:@"/Users/shenfan/OCProjects/SimpleApp/SimpleApp/Image/right_disable.png"];
    return cell;
}



/*
 1、创建UITableView，设置delegate和datasource，通过两个delegate
 2、选择实现UITableViewDataSource中方法，行数、cell复用
 3、选择实现UITableViewDelegate中方法（高度、headerFooter、点击）
 */
@end
