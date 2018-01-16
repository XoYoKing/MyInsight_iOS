//
//  MarkTableVC.m
//  MyInsight
//
//  Created by SongMenglong on 2017/12/1.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import "MarkTableVC.h"
#import <SWRevealViewController.h>
#import "BaiduMapVC.h" // 百度地图
#import "SystemMapVC.h" // 系统地图
#import "YahooMapVC.h" // 雅虎地图
#import "GoogleMapVC.h" // 谷歌地图

@interface MarkTableVC ()

// 数据数组
@property (nonatomic, strong) NSArray *dataArray;

@end

// 定义字符串
const NSString *BaiduMapStr = @"百度地图";
const NSString *SystemMapStr = @"系统(高德)地图";
const NSString *GoogleMapStr = @"谷歌地图";
const NSString *YahooMapsStr = @"YahooMap";

@implementation MarkTableVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([self revealViewController] != NULL) {
        [[self revealViewController] tapGestureRecognizer];
        [self.view addGestureRecognizer:[self revealViewController].panGestureRecognizer];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([self revealViewController] != NULL) {
        [self.view removeGestureRecognizer:[self revealViewController].panGestureRecognizer];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"地图";
    self.view.backgroundColor = [UIColor whiteColor];
    // 初始化数组
    self.dataArray = [NSMutableArray arrayWithArray:@[BaiduMapStr, SystemMapStr, GoogleMapStr, YahooMapsStr]];
    // 设置tableview
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"mapcell"];
    // 清空多余cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 实现代理协议
// section个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// cell的row个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// 生成cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mapcell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

// 选择cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取字符串
    NSString *indexString = [self.dataArray objectAtIndex:indexPath.row];
    
    if ([indexString isEqual:BaiduMapStr]) {
        // 百度地图
        BaiduMapVC *baiduMapVC = [[BaiduMapVC alloc] init];
        baiduMapVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:baiduMapVC animated:YES];
    }
    if ([indexString isEqual:SystemMapStr]) {
        // 系统地图
        SystemMapVC *systemMapVC = [[SystemMapVC alloc] init];
        systemMapVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:systemMapVC animated:YES];
    }
    if ([indexString isEqual:GoogleMapStr]) {
        // 谷歌地图
        GoogleMapVC *googleMapVC = [[GoogleMapVC alloc] init];
        googleMapVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:googleMapVC animated:YES];
    }
    if ([indexString isEqual:YahooMapsStr]) {
        // 雅虎地图
        YahooMapVC *yahooMapVC = [[YahooMapVC alloc] init];
        yahooMapVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:yahooMapVC animated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
