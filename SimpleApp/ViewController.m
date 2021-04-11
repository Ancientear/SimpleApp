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

@interface ViewController() <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
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
    cell.textLabel.text = @"主标题";
    cell.detailTextLabel.text = @"副标题";
    cell.imageView.image = [UIImage imageNamed:@"/Users/shenfan/OCProjects/SimpleApp/SimpleApp/Image/right_disable.png"];
    return cell;
}

@end
