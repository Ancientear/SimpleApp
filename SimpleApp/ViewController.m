//
//  ViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/8.
//

#import "ViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
@interface TestView : UIView
@end


@interface ViewController() <UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>

@end

@implementation ViewController

- (instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icons8-kawaii-jam-50.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icons8-kawaii-milk-50.png"];
    }
    return self;
}

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
    return 100;
}
//点击触发的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GTDetailViewController *controller = [[GTDetailViewController alloc]init];
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
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCell];
    return cell;
}

//在GTNormalTbaleViewCell中创建的delegate，方法重写，可以具体到某个cell和button
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
    GTDeleteCellView *deleteView = [[GTDeleteCellView alloc]initWithFrame:self.view.bounds];
    
    //将cell点击按钮处的坐标系转换到整个屏幕的坐标系
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
        NSLog(@"");
    }];
}


/*
 1、创建UITableView，设置delegate和datasource，通过两个delegate
 2、选择实现UITableViewDataSource中方法，行数、cell复用
 3、选择实现UITableViewDelegate中方法（高度、headerFooter、点击）
 */
@end
