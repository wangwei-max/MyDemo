//
//  BubbleBtn.m
//  LoveBtn
//
//  Created by MAX on 16/5/9.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "BubbleBtn.h"

@implementation BubbleBtn

{
    CGPoint _startPoint;
    CGFloat _maxWidth;
    NSMutableSet *_recyclePool;
    NSMutableArray *_array;
}

-(instancetype)initWithFrame:(CGRect)frame maxLeft:(CGFloat)maxLeft maxRight:(CGFloat)maxRight maxHeight:(CGFloat)maxHeight
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxHeight = maxHeight;
        _maxLeft   = maxLeft;
        _maxRight  = maxRight;
        _images = @[[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"]];
        _duration = 3;
        
        [self initData];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self initData];
    }
    return self;
}

-(void)initData
{
    _array = @[].mutableCopy;
 
}


-(void)BulleBtnWithRandowWithNum:(NSInteger)num;
{
    CALayer *layer;
    
    UIImage *image = self.images[num];
    layer = [self BubbleBtnLayerWithImage:image];
    [self.layer addSublayer:layer];
    [self BubbleBtnWithLayer:layer];

}

-(void)BubbleBtnWithImage:(UIImage *)image;
{
    
    CALayer *layer = [self BubbleBtnLayerWithImage:image];
    [self.layer addSublayer:layer];
    [self BubbleBtnWithLayer:layer];
}

-(CALayer *)BubbleBtnLayerWithImage:(UIImage *)image
{
    CGFloat scale = 0.8;
    CALayer *layer = [CALayer layer];
    layer.frame    = CGRectMake(0, 0, image.size.width / scale, image.size.height / scale);
    layer.contents = (__bridge id)image.CGImage;;
    return layer;
}
-(void)BubbleBtnWithLayer:(CALayer *)layer
{
    _maxWidth = _maxLeft + _maxRight;
    // ?
    _startPoint = CGPointMake(self.frame.size.width / 2, 0);
    
    // ?
    CGPoint endPoint   = CGPointMake(_maxWidth * [self randomFloat] - _maxLeft, -_maxHeight);
    CGPoint controlPoint1 =
    CGPointMake(_maxWidth * [self randomFloat] - _maxLeft, -_maxHeight * 0.2);
    CGPoint controlPoint2 =
    CGPointMake(_maxWidth * [self randomFloat] - _maxLeft, -_maxHeight * 0.6);
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, _startPoint.x, _startPoint.y);
    CGPathAddCurveToPoint(curvedPath, NULL, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, endPoint.x, endPoint.y);
    // 上升动画
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animation];
    keyFrame.keyPath = @"position";
    keyFrame.path = CFAutorelease(curvedPath);
    keyFrame.duration = self.duration;
    keyFrame.calculationMode = kCAAnimationPaced;
    [layer addAnimation:keyFrame forKey:@"keyframe"];
    
    // 从小变大的过程
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @1;
    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)];
    scale.duration = 0.5;
    // 渐变动画
    CABasicAnimation *alpha = [CABasicAnimation animation];
    alpha.keyPath = @"opacity";
    alpha.fromValue = @1;
    alpha.toValue = @0.1;
    alpha.duration = self.duration * 0.4;
    alpha.beginTime = self.duration - alpha.duration;
    // 动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[keyFrame, scale, alpha];
    group.duration = self.duration;
    group.delegate = self;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [layer addAnimation:group forKey:@"group"];
    
    [_array addObject:layer];

}




-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
{
    if (flag) {
        CALayer *layer = [_array firstObject];
        [layer removeAllAnimations];
        [layer removeFromSuperlayer];
        [_array removeObject:layer];
    self.userInteractionEnabled = YES;
    }
}

-(CGFloat)randomFloat{
    return (arc4random() % 100)/100.0f;
}
@end
