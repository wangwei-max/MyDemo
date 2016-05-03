//
//  ViewController.m
//  RedAndYellow
//
//  Created by MAX on 16/4/20.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "SmallTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "SDWebImage/SDWebImageManager.h"
#import "Cell.h"
#import "ImageRequest.h"
#import "ImageModel.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tv;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)ImageModel *model1;
@end

@implementation ViewController

-(void)post;
{
    ImageRequest *ImageRequestApi = [[ImageRequest alloc] initWithCurrentPage:1 Name:@"" ScreeningId:@"" TagId:@"" Username:@"" Password:@""];
    [ImageRequestApi startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        NSLog(@"request.responseJSONObject == %@，responseString == %@",request.responseJSONObject,request.responseString);
        NSArray *tempArry = request.responseJSONObject[@"data"];
        for (NSDictionary *tempDic in tempArry) {
            ImageModel *model = [[ImageModel alloc] init];
            [model parseWithDic:tempDic];
            NSLog(@"tempDic-----%@",tempDic);
            [self.dataArray addObject:model];
        }
        [self.tv reloadData];
    } failure:^(YTKBaseRequest *request) {
        NSLog(@"失败");
    }];
}
-(ImageModel *)model
{
    if (!_model1) {
        _model1 = [[ImageModel alloc] init];
    }
    return _model1;
}
-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
    }
    return _dataArray;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self post];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    
}

-(void)creatView
{
    _tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tv.delegate=self;
    self.tv.dataSource=self;
    [self.view addSubview:self.tv];
    [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:@"pic.daydaycook.com/production/images/20160403/9743c708-6532-4468-ba9c-80d35a4974c5"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count+1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        return 300;
    }
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   static NSString *cellId=@"cellId";
    static NSString *ImageCellId = @"ImageCell";
    if (indexPath.row==self.dataArray.count) {
        Cell *cell=[tableView dequeueReusableCellWithIdentifier:ImageCellId];
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"Cell" owner:nil options:nil] lastObject];
        }
        
        cell.userInteractionEnabled = NO;
        return cell;
    }else{
        self.model1=[self.dataArray objectAtIndex:indexPath.row];
        SmallTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"SmallTableViewCell" owner:nil options:nil] lastObject];
        }
       
        [cell.headPic sd_setImageWithURL:[NSURL URLWithString:self.model.imageUrl]];
        cell.nametitle = [NSString stringWithFormat:@"%@",self.model.name];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *displayCell=[self.tv cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    SmallTableViewCell *selectedCell=[self.tv cellForRowAtIndexPath:indexPath];
    displayCell.Image.image=selectedCell.headPic.image;
    self.model1=[self.dataArray objectAtIndex:indexPath.row];
    displayCell.nameText.text = self.model1.name;
//    [displayCell.imageView sd_setImageWithURL:[NSURL URLWithString:self.model1.imageUrl]];
    
}

@end
