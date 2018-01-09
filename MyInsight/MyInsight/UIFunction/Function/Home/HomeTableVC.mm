//
//  HomeTableVC.m
//  MyInsight
//
//  Created by SongMenglong on 2017/12/1.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import "HomeTableVC.h"
#import "PortraitScreenVC.h" // 竖屏
#import "ScaleVC.h" // 三等分约束布局
#import "BlueToothVC.h" // 蓝牙(系统)
#import "BabyBleVC.h" // 蓝牙(三方)
#import "OpenCVVC.h" // OpenCV
#import "FFmpegVC.h" // FFmpegVC
#import <SWRevealViewController.h>

@interface HomeTableVC ()
// 数组
@property (nonatomic, strong) NSMutableArray *handleDataArray;

@end

// 定义字符串
const NSString *ScreenStr = @"横竖屏";
//const NSString *BaiduMapStr = @"百度地图";
//const NSString *SystemMapStr = @"系统(高德)地图";
//const NSString *GoogleMapStr = @"谷歌地图";
//const NSString *YahooMapEstr = @"YahooMap";
const NSString *ScaleStr = @"自动比例约束布局";
const NSString *BlueToothStr = @"蓝牙(系统)";
const NSString *BabyBLEStr = @"蓝牙(三方)";
const NSString *OpenCVStr = @"OpenCV";
const NSString *FFmpegStr = @"FFmpeg";

@implementation HomeTableVC

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
    
    self.title = @"主页";
    // 初始化数组
    self.handleDataArray = [NSMutableArray arrayWithArray:@[BlueToothStr, BabyBLEStr, ScreenStr, ScaleStr, OpenCVStr, FFmpegStr]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    // 适配iOS11
    
    // 清空多余cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.handleDataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.handleDataArray objectAtIndex:indexPath.row];
    
    return cell;
}

// 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取字符串
    NSString *indexString = [self.handleDataArray objectAtIndex:indexPath.row];
    
    if ([indexString isEqual:ScreenStr]) {
        // 横竖屏
        PortraitScreenVC *portraitScreenVC = [[PortraitScreenVC alloc] init];
        portraitScreenVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:portraitScreenVC animated:YES];
    }
    if ([indexString isEqual:ScaleStr]) {
        // 等分布局
        ScaleVC *scaleVC = [[UIStoryboard storyboardWithName:@"Home" bundle:NULL] instantiateViewControllerWithIdentifier:@"ScaleVC"];
        scaleVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:scaleVC animated:YES];
    }
    if ([indexString isEqual:BlueToothStr]) {
        // 蓝牙(系统)
        BlueToothVC *blueToothVC = [[BlueToothVC alloc] init];
        blueToothVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:blueToothVC animated:YES];
    }
    if ([indexString isEqual:BabyBLEStr]) {
        // 蓝牙(三方)
        BabyBleVC *babyBleVC = [[BabyBleVC alloc] init];
        babyBleVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:babyBleVC animated:YES];
    }
    if ([indexString isEqual:OpenCVStr]) {
        // OpenCV
        OpenCVVC *openCVVC = [[UIStoryboard storyboardWithName:@"Home" bundle:NULL] instantiateViewControllerWithIdentifier:@"OpenCVVC"];
        openCVVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:openCVVC animated:YES];
    }
    if ([indexString isEqual:FFmpegStr]) {
        // FFmpeg
        FFmpegVC *ffmpegVC = [[FFmpegVC alloc] init];
        ffmpegVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ffmpegVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
