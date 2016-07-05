//
//  CircleLayout.m
//  循环滚动复用
//
//  Created by MAX on 16/7/5.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "CircleLayout.h"

@interface CircleLayout()
@property (nonatomic,strong)NSMutableArray *attrsArray;
@end

@implementation CircleLayout
-(NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

-(void)prepareLayout
{
    [super prepareLayout];
    [self.attrsArray removeAllObjects];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}
/*
    这个方法需返回indexpath位置对应cell的布局属性
 */
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    CGFloat radius =80;
    //圆心
    CGFloat oX = self.collectionView.frame.size.width*0.5;
    CGFloat oY = self.collectionView.frame.size.height*0.5;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(50, 50);
    if (count == 1) {
        attrs.center = CGPointMake(oX,oY);
    }
    CGFloat angle = (2 *M_PI/count) *indexPath.item;
    CGFloat centerX = oX + radius *sin(angle);
    CGFloat centerY = oY + radius *cos(angle);
    attrs.center = CGPointMake(centerX, centerY);
   
    return attrs;
}

@end
