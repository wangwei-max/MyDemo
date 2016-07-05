//
//  ViewController.m
//  循环滚动复用
//
//  Created by MAX on 16/7/1.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "GriditLayout.h"
#import "PhotoCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

static NSString *const cellID =@"photo";

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建布局
    GriditLayout *layout = [[GriditLayout alloc] init];

    
    //创建collectionView
    CGRect frame = self.view.bounds;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    //注册
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:cellID];
    
}


#pragma mark -<UICollectionViewDataSource>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.imageName = [NSString stringWithFormat:@"%zd",indexPath.item+1];
    return cell;
}

#pragma  mark --delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
