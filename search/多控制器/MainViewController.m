//
//  ViewController.m
//  多控制器
//
//  Created by MAX on 16/5/10.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "MainViewController.h"
#import "Contact.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tv;

@end

@implementation MainViewController
- (IBAction)addContact:(id)sender {
//    EditViewController *editvc = [[EditViewController alloc] init];
//    [self presentViewController:editvc animated:YES completion:nil];
    [self performSegueWithIdentifier: @"addContact" sender:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    初始化数据
    self.contactsData = [NSMutableArray array];
    for (int i = 0; i<3; i++) {
        Contact *contact = [[Contact alloc] init];
        contact.name = [NSString stringWithFormat:@"联系人%d",i+1];
        contact.tel = [NSString stringWithFormat:@"1861010%04d",arc4random_uniform(1000)];
        [self.contactsData addObject:contact];
    }
//    设置tableview数据和代理
    self.tv.delegate = self;
    self.tv.dataSource = self;
    
    self.searchDisplay.delegate = self;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    如果是搜索的表格
    if (tableView == self.searchDisplay.searchResultsTableView) {
        return self.searchResult.count;
    }
    else{
        return self.contactsData.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //设置cellId
    static NSString *cellId = @"contactCell";
    UITableViewCell *cell = [self.tv dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellId];
    }
    //设置cell属性
    Contact *contact;
    if (tableView == self.searchDisplay.searchResultsTableView) {
       contact = self.searchResult[indexPath.row];
    }

    else{
       contact = self.contactsData[indexPath.row];
    }
    
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.tel;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showCantact" sender:self];

}

#pragma mark Segue跳转前准备工作
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addContact"]) {
        NSLog(@"add");
        EditViewController *editVC = segue.destinationViewController;
        editVC.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"showCantact"])
    {
        ShowViewController *showVC= segue.destinationViewController;
        NSIndexPath *indexPath =  [self.tv indexPathForSelectedRow];
        showVC.contact = self.contactsData[indexPath.row];
    }
}

//回传数据的代理方法 写在a上

-(void)backWithContact:(Contact *)contact IsEditing:(BOOL)isEditing;
{
    if (!isEditing)//add
    {
        [self.contactsData addObject:contact];
    }
    [self.tv reloadData];
}


#pragma mark搜索是调用的方法
-(void)seatchWithString:(NSString *)string
{
    NSPredicate *query = [NSPredicate predicateWithFormat:@"SELF.name contains[c]%@",string];
    self.searchResult = [self.contactsData filteredArrayUsingPredicate:query];
    NSLog(@"%@",self.searchResult);
   
    
}

#pragma mark - searchBar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self seatchWithString:searchBar.text];
    [self.searchDisplay.searchResultsTableView reloadData];
    [searchBar endEditing:YES];
}


@end
