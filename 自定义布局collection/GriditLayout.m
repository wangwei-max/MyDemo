//
//  GriditLayout.m
//  循环滚动复用
//
//  Created by MAX on 16/7/4.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "GriditLayout.h"

@interface GriditLayout ()
@property (nonatomic,strong)NSMutableArray *attrsArray;

@end

@implementation GriditLayout
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
        //创建
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        
        //设置布局属性
        CGFloat width = self.collectionView.frame.size.width *0.5;
        if (i == 0) {
            CGFloat heigth = width;
            CGFloat X = 0;
            CGFloat Y = 0;
            attrs.frame = CGRectMake(X, Y, width, heigth);
        }
        else if (i == 1)
        {
            CGFloat heigth = width* 0.5;
            CGFloat X = width;
            CGFloat Y = 0;
            attrs.frame = CGRectMake(X, Y, width, heigth);
        }
        else if(i == 2)
        {
            CGFloat heigth = width* 0.5;
            CGFloat X = width;
            CGFloat Y = heigth;
            attrs.frame = CGRectMake(X, Y, heigth,heigth);
        }
        else if (i == 3)
        {
            CGFloat heigth = width* 0.5;
            CGFloat X = width *0.5 +width;
            CGFloat Y = heigth;
            attrs.frame = CGRectMake(X, Y, heigth, heigth);
        }
        else if (i == 4)
        {
            CGFloat heigth = width* 0.5;
            CGFloat X = 0;
            CGFloat Y = width;
            attrs.frame = CGRectMake(X, Y, width, heigth);
        }
        else if (i == 5)
        {
            CGFloat heigth = width* 0.5;
            CGFloat X = 0;
            CGFloat Y = heigth+width;
            attrs.frame = CGRectMake(X, Y, heigth, heigth);
        }
        else if(i == 6)
        {
            CGFloat heigth = width* 0.5;
            CGFloat X = width*0.5;
            CGFloat Y = width + heigth;
            attrs.frame = CGRectMake(X, Y, heigth, heigth);
        }
        else if(i == 7)
        {
            CGFloat heigth = width;
            CGFloat X = width;
            CGFloat Y = width;
            attrs.frame = CGRectMake(X, Y, width, heigth);
        }
        else{
            UICollectionViewLayoutAttributes *lastAttrs = self.attrsArray[i-8];
            CGRect lastFrame = lastAttrs.frame;
            lastFrame.origin.y += 2*width;
            attrs.frame = lastFrame;
        }
        //添加 attrs
        [self.attrsArray addObject:attrs];
    }

    
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
        return self.attrsArray;
}

/*返回collecttionView内容大小 contentszie*/
-(CGSize)collectionViewContentSize
{
    int count =(int) [self.collectionView numberOfItemsInSection:0];
    int rows = (count +4-1)/4;
    CGFloat rowH = self.collectionView.frame.size.width *0.5;

    return CGSizeMake(0, rows*rowH);
}
@end
