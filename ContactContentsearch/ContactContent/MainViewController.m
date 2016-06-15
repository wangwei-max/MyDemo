//
//  MainViewController.m
//  ContactContent
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "MainViewController.h"
#import "EditViewController.h"
#import "DetailViewController.h"
#import "DataModel.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,EditViewDelegate>{
    NSInteger clickIndex;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIBarButtonItem *rightItem;
@property(nonatomic,strong)DataModel *model;
@property(nonatomic,strong)DetailViewController *detail;
@end

@implementation MainViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
-(DataModel *)model{
    if (!_model) {
        _model=[[DataModel alloc]init];
    }
    return _model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview =[[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    [self.view addSubview:self.tableview];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.detail) {
        [self.detail removeObserver:self forKeyPath:@"Model"];
        self.detail=nil;
    }
    
    self.rightItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(wocao)];
    self.navigationItem.rightBarButtonItem=self.rightItem;
}
#pragma mark - UITableviewDelegate & Datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cellId";
    self.model=[self.dataArray objectAtIndex:indexPath.row];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text=self.model.contectName;
    return cell;
}
-(void)wocao{
    EditViewController *edit=[[EditViewController alloc]init];
    edit.delegate=self;
    [self presentViewController:edit animated:YES completion:nil];
}
-(void)DoneWithModel:(DataModel *)model{
    [self.dataArray addObject:model];
    [self.tableview reloadData];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    clickIndex=indexPath.row;
    
    self.detail = [[DetailViewController alloc]init];
    DataModel *model = self.dataArray[indexPath.row];
    self.detail.Model = model;
    
    [self.detail addObserver:self forKeyPath:@"Model" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.navigationController pushViewController:self.detail animated:YES];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    DataModel *newModel=(DataModel *)[change objectForKey:@"new"];
    [self.dataArray replaceObjectAtIndex:clickIndex withObject:newModel];
    [self.tableview reloadData];
}
@end
