//
//  MapsVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/25.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "MapsVC.h"

@interface MapsVC ()

// 数据数组
@property (nonatomic, strong) NSArray *dataArray;

@end

// 定义字符串
const NSString *BaiduMapStr = @"百度地图";
const NSString *SystemMapStr = @"系统(高德)地图";
const NSString *GoogleMapStr = @"谷歌地图";
const NSString *YahooMapsStr = @"YahooMap";

@implementation MapsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化数组
    self.dataArray = [NSMutableArray arrayWithArray:@[BaiduMapStr, SystemMapStr, GoogleMapStr, YahooMapsStr]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
