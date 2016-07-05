//
//  LineLayout.m
//  循环滚动复用
//
//  Created by MAX on 16/7/1.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "LineLayout.h"

@implementation LineLayout
-(instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

/*
 * 当collectionview的显示范围发生变化的时候，是否需要重新刷新布局
 * 这个方法的返回决定了rect范围内所有元素的布局（frame）
 一旦重新刷新布局，就会重新调用下面的方法：
 layoutAttributesForElementsInRect
 prepareLayout
 
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}


/*
 * 用来做布局的初始化操作（不建议在init方法中进行布局的初始化操作）
 一定要调用
 */

-(void)prepareLayout
{
    [super prepareLayout];
    //设置内边距
    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width)*0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);

}


/*
 * 这个方法的返回值是一个数组（数组里面存放着rect范围内所有元素的布局属性）
 * 这个方法的返回值决定了rect反胃内所有元素的排布（frame）
 */
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
/*
 UICollectionViewLayoutAttributes *attrs;
 1.一个cell对应UICollectionViewLayoutAttributes
 2.UICollectionViewLayoutAttributes决定了cell的frame
 */
{
    //获得super已经计算好的布局属性
    NSArray *array =  [super layoutAttributesForElementsInRect:rect];
    
    //计算collecttionView中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x +self.collectionView.frame.size.width *0.5;
    
    //在原有布局属性的基础上，进行微调
    for (UICollectionViewLayoutAttributes *attrs in array) {
        //cell的中心点的x 和 collectionview最中心点的x值 的距离
            CGFloat delta =  ABS(attrs.center.x - centerX);
        //根据间距值 计算cell的缩放比例
        CGFloat scale = 1 - delta / self.collectionView.frame.size.width;
        
        //设置缩放比例
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
//        CGFloat scale = arc4random_uniform(100)/100.0;
//        attrs.transform = CGAffineTransformMakeScale(scale, scale);
        　
    }
    return array;
}

/*
 * 这个方法的返回值，就决定了collectionview停止滚动时候的偏移量
 * ）
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //计算出最终的句型框
    CGRect rect;
    rect.origin.y = 0 ;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    //获得super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //计算collectionview 中心点的x值
    CGFloat centerX = proposedContentOffset.x+self.collectionView.frame.size.width*0.5;
    //存放最小的值
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if (ABS(minDelta > ABS(attrs.center.x - centerX))) {
            minDelta = attrs.center.x - centerX;
        } ;
    }
    //修改原有的偏移量
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}
/*
 1.cell放大缩小
 2.停止滚动时：cell居中
 */
@end
