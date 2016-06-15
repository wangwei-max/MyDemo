//
//  BubbleBtn.h
//  LoveBtn
//
//  Created by MAX on 16/5/9.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleBtn : UIButton
-(instancetype)initWithFrame:(CGRect)frame
                     maxLeft:(CGFloat)maxLeft
                    maxRight:(CGFloat)maxRight
                   maxHeight:(CGFloat)maxHeight;

@property (nonatomic,strong)NSArray *images;
@property (nonatomic,assign)CGFloat maxLeft;
@property (nonatomic,assign)CGFloat maxRight;
@property (nonatomic,assign)CGFloat maxHeight;
@property (nonatomic,assign)CGFloat duration;



-(void)BubbleBtnWithImage:(UIImage *)image;

-(void)BulleBtnWithRandowWithNum:(NSInteger)num;

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
@end
