//
//  ViewController.m
//  循环滚动复用
//
//  Created by MAX on 16/7/1.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "CircleLayout.h"
#import "PhotoCell.h"
#import "LineLayout.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,weak)UICollectionView *collectView;
@property (nonatomic,strong)NSMutableArray *imageNames;
@end

static NSString *const cellID =@"photo";

@implementation ViewController
-(NSMutableArray *)imageNames
{
    if (!_imageNames) {
        _imageNames = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            [_imageNames addObject:[NSString stringWithFormat:@"%zd",i +1]];
        }
    }
    return _imageNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建布局
    CircleLayout *layout = [[CircleLayout alloc] init];
    
    //创建collectionView
    CGFloat collectionW = self.view.frame.size.width;
    CGFloat collectionH = 300;
    CGRect frame = CGRectMake(0, (self.view.frame.size.height-collectionH)*0.5, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate =self;
    [self.view addSubview:collectionView];
    self.collectView = collectionView;
    
    //注册
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:cellID];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.collectView.collectionViewLayout isKindOfClass:[LineLayout class]]) {
        [self.collectView setCollectionViewLayout:[[CircleLayout alloc] init] animated:YES];
    }
    else
    {
        LineLayout *layout = [[LineLayout alloc]init];
        layout.itemSize = CGSizeMake(150, 150);
        [self.collectView setCollectionViewLayout:layout animated:YES];
    }
 
}

#pragma mark -<UICollectionViewDataSource>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageNames.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.imageName = self.imageNames[indexPath.item];
    return cell;
}

#pragma  mark --delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.imageNames removeObjectAtIndex:indexPath.item];
    [self.collectView deleteItemsAtIndexPaths:@[indexPath]];
}

@end
