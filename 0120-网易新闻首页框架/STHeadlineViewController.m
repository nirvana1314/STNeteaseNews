//
//  STHeadlineViewController.m
//  0120-网易新闻首页框架
//
//  Created by 李松涛 on 15-1-30.
//  Copyright (c) 2015年 lst. All rights reserved.
//

#import "STHeadlineViewController.h"
#import "STNetWorkTools.h"
#import "STNewsModel.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
static NSString * const ID = @"cell";
@interface STHeadlineViewController ()
@property (strong, nonatomic) NSArray *dataList;

@end

@implementation STHeadlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    [self loadData];
    
    self.tableView.rowHeight = 80;
}

-(void)setDataList:(NSArray *)dataList
{
    _dataList = dataList;
    
    [self.tableView reloadData];
}

- (void)loadData
{
    STNetWorkTools *tools = [STNetWorkTools sharedSTNetWorkTools];
    NSURLSessionDataTask *task = [tools GET:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
        //NSEnumerator计数器对象获取字典中第一个key,并从res中取出key对应的数组
        NSString *key = [responseObject.keyEnumerator nextObject];
        //遍历数组
        NSArray *dictArray = responseObject[key];
        
        self.dataList = [STNewsModel objectArrayWithKeyValuesArray:dictArray];
        NSLog(@"%@", self.dataList);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
    }];
    [task resume];
}

#pragma mark - TableView的数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    STNewsModel *newModel = self.dataList[indexPath.row];
    cell.textLabel.text = newModel.title;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:newModel.imgsrc] placeholderImage:[UIImage imageNamed:@"avatar_default"]];

    return cell;
}


@end
