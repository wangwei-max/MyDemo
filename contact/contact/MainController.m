//
//  MainController.m
//  contact
//
//  Created by MAX on 16/5/11.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "MainController.h"
#import "EditController.h"
#import "ContectModel.h"
#import "shwoController.h"
@interface MainController ()<UITableViewDelegate,UITableViewDataSource,EditControllerDelegate>
@property (strong,nonatomic)UIBarButtonItem *rightBtn;
@property (strong,nonatomic)UITableView *tv;
@property (strong,nonatomic)NSMutableArray *dataArr;
@property (strong,nonatomic)ContectModel *model;

@end

@implementation MainController

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(ContectModel *)model
{
    if (!_model) {
        _model = [[ContectModel alloc] init];
    }
    return _model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tv = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tv.delegate = self;
    self.tv.dataSource = self;
    [self.view addSubview:self.tv];
   
    
    for (int i = 0; i<3; i++) {
        ContectModel *model = [[ContectModel alloc] init];
        model.name = [NSString stringWithFormat:@"姓名%d",i+1];
        model.tel = [NSString stringWithFormat:@"1360172%04d",arc4random_uniform(1000)];
        [self.dataArr addObject:model];
        NSLog(@"%ld",self.dataArr.count);
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBtnAction:)];
    self.title = @"首页";
    self.navigationItem.rightBarButtonItem =self.rightBtn;
}

-(void)rightBtnAction:(UIButton *)sender
{
    EditController *edit = [[EditController alloc] init];
    edit.delegate = self;
    [self presentViewController:edit animated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"contacntCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
    }
    self.model = self.dataArr[indexPath.row];
    cell.textLabel.text = self.model.name;
    cell.detailTextLabel.text = self.model.tel;
    return cell;
}

-(void)EditControllerDoneWithModel:(ContectModel *)model
{
    [self.dataArr addObject:model];
    [self.tv reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    shwoController *show = [[shwoController alloc] init];
    show.model = self.dataArr[indexPath.row];
    [self.navigationController pushViewController:show animated:YES];
}
@end
