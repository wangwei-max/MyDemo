//
//  TableViewController.m
//  购物车
//
//  Created by MAX on 16/5/9.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "TableViewController.h"
#import "Product.h"
#import "shopCell.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    self.productArr = [NSMutableArray array];
    self.favoriteArr = [NSMutableArray arrayWithCapacity:0];
   
    for (int i = 0; i<30; i++) {
        Product *p = [[Product alloc] init];
        p.name = [NSString stringWithFormat:@"产品%02d",i+1];
        p.price =( arc4random()%10000)/100.0;
        p.imageName = [NSString stringWithFormat:@"%d",arc4random_uniform(8)+1];
        [self.productArr addObject:p];
    }
    //设置行高
    self.tableView.rowHeight = 80;
    //设置tableview不能被点击
    self.tableView.allowsSelection = NO;
}


-(void)favorite:(UIButton *)send event:(UIEvent *)event
{
//  第一种方法设置tag
//    NSLog(@"%d",send.tag);
    
// 第二种方法，找到send的父视图（contview）的父视图（contview）cell
//    shopCell *cell = send.superview.superview;
//     NSIndexPath *path = [self.tableView indexPathForCell:cell];
//    NSLog(@"%ld",path.row);
  
//第三种方法，通过touches
    NSSet *touches = event.allTouches;
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.tableView];
    NSInteger path = [self.tableView indexPathForRowAtPoint:point];
    
}

-(void)buy:(UIButton *)send
{
    NSLog(@"222");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *cellId = @"shopCell";
    //1,从对象池查找可用的cell
    shopCell *cell = ( shopCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    //2.没有就创建cell
    if (!cell) {
        cell = [shopCell shopCell];
        [cell.favoriteBt addTarget:self action:@selector(favorite:event:) forControlEvents:UIControlEventTouchUpInside];
        [cell.buyBtn addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];

    }
    //3.通过数据设置cell的属性
    Product *p = self.productArr[indexPath.row];
    [cell setProduct:p];
//第一种方法设置tag
////   设置tag
//    cell.favoriteBt.tag = indexPath.row;
//    cell.buyBtn.tag = indexPath.row;
    return cell;
}



@end
