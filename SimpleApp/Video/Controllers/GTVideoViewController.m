//
//  GTVideoViewController.m
//  SimpleApp
//
//  Created by 申凡 on 2021/4/12.
//

#import "GTVideoViewController.h"
#import "GTVideoCoverView.h"
#import "GTVideoToolbar.h"

@interface GTVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GTVideoViewController

- (instancetype) init {
	self = [super init];
	if(self) {
		self.tabBarItem.title = @"视频";
		self.tabBarItem.image = [UIImage imageNamed:@"icons8-kawaii-noodle-50.png"];
		self.tabBarItem.selectedImage = [UIImage imageNamed:@"icons8-kawaii-taco-50.png"];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];

	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];

	//设置布局间距以及大小，这个方法所有的item都是相同的
	flowLayout.minimumLineSpacing = 10;
	flowLayout.minimumInteritemSpacing = 10;
	flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9 + GTViderToolbarHeight);

	//1.创建一个UICollectionView需要屏幕的大小和一个flowLayout
	UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];

	//2.和UITable一样需要设置delegate和dataSource
	collectionView.delegate = self;
	collectionView.dataSource = self;

	//3.UICollectionView需要注册cell
	//[collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"GTVideoCoverView"];
    [collectionView registerClass:[GTVideoCoverView class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
	[self.view addSubview:collectionView];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	//在自动池中取到了一个cell
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[GTVideoCoverView class]]) {
        //http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        [((GTVideoCoverView*)cell) layoutWithVideoCoverUrl:@"icon.bundle/videoCover@3x.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
        
    }
	return cell;

}

////区分处理size,使样式更多，每个cell的布局信息均可改，更细化的自定义cell
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//	if(indexPath.item % 3 == 0) {
//		return CGSizeMake(self.view.frame.size.width, 100);
//	}else{
//		return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
//	}
//}

@end
