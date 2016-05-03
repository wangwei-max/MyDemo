//
//  ViewController.m
//  tv
//
//  Created by MAX on 16/4/21.
//  Copyright © 2016年 MAX. All rights reserved.
//


#define URL_Search(currentPage,name,screeningId,tagId,username,password) [NSString stringWithFormat:@"%@/recipe/search.do?currentPage=%d&pageSize=20&name=%@&categoryId=&parentId=&screeningId=%@&tagId=%@&username=%@&password=%@",BaseUrl,currentPage,name,screeningId,tagId,username,password]

// NSString *mydescription;
//    //2016-04-06
// NSString *releaseDate ;
//
//    //日式南瓜鸡肉杂菇炊饭
//  NSString * name;
//
//   ) NSString *imageUrl;
#import "ViewController.h"
#import "Tools.h"
#import "AFNetworking.h"
#import "Model.h"
#import "Cell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tv;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)Model *model;
@end

@implementation ViewController

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self netWork];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self creatSubView];
}

-(void)creatSubView
{
    self.tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tv.delegate = self;
    self.tv.dataSource = self;
    [self.view addSubview:self.tv];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    Cell *cell = (Cell *)[self tableView:self.tv cellForRowAtIndexPath:indexPath];
    Cell *cell = (Cell *)[self tableView:self.tv cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *delatiId = @"delati";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:delatiId];
    if (!cell) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:delatiId];
    }
    self.model = [self.dataArr objectAtIndex:indexPath.row];
    [cell resizingSubViewsWithName:self.model.name Datei:self.model.mydescription Time:self.model.releaseDate];
    [cell.topimage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.model.imageUrl]]];
    return cell;
}

-(void)netWork
{
    [Tools POST:URL_Search(1,@"",@"",@"",@"",@"") params:nil superviewOfMBHUD:nil success:^(id responseObj) {
        NSArray *tempArr = responseObj[@"data"];
        for (NSDictionary *dic in tempArr) {
            Model *model = [[Model alloc] init];
            [model withDic:dic];
            [self.dataArr addObject:model];
            NSLog(@"&=====%@",_dataArr);
        }
        [self.tv reloadData];
    } failure:^(NSError *error) {
        NSLog(@"失败");
    }];
}
@end
