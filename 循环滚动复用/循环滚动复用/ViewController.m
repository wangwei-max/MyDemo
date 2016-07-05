//
//  ViewController.m
//  循环滚动复用
//
//  Created by MAX on 16/7/1.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "LineLayout.h"
#import "PhotoCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

static NSString *const cellID =@"photo";

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建布局
    LineLayout *layout = [[LineLayout alloc] init];
    //每个格子的大小
    layout.itemSize = CGSizeMake(120, 120);
    //水平滚动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //创建collectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 200;
    CGRect frame = CGRectMake(0, (self.view.frame.size.height-collectionH)*0.5, collectionW, collectionH);
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
    return 20;
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
