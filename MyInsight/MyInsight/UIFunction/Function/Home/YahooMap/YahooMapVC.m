//
//  YahooMapVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/3.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "YahooMapVC.h"
#import <YMapKit/YMapKit.h>
#import "CUPointAnnotation.h"

@interface YahooMapVC ()<YMKMapViewDelegate>

//var yahooMap: YMKMapView!
//var calloutMapAnnotation: CalloutMapAnnotation!

@property (nonatomic, strong) YMKMapView *yahooMap;

@end



@implementation YahooMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"雅虎地图";
    
    // 创建Yahoo地图
    [self creatYahooMap];
}

#pragma mark 创建Yahoo地图
- (void)creatYahooMap {
    self.view.backgroundColor = [UIColor whiteColor];
    // key
    NSString *YAHOO_APP_KEY = @"dj0zaiZpPXNUeEh5WHNZYkFzUyZzPWNvbnN1bWVyc2VjcmV0Jng9NmQ-";
    // 初始化地图
    self.yahooMap = [[YMKMapView alloc] initWithFrame:self.view.bounds appid:YAHOO_APP_KEY];
    self.yahooMap.mapType = YMKMapTypeStandard;
    self.yahooMap.showsUserLocation = YES;
    self.yahooMap.delegate = self;
    // 赋值给地图
    self.view = self.yahooMap;
    
    // 东京塔
    CLLocationCoordinate2D center;
    center.latitude = 35.665818701569016;
    center.longitude = 139.73087297164147;
    
    self.yahooMap.centerCoordinate = center;
    self.yahooMap.region = YMKCoordinateRegionMake(center, YMKCoordinateSpanMake(0.002, 0.002));
    
    [self.yahooMap invalidateIntrinsicContentSize];
    
    // 大头针泡泡的初始化
    
    // 添加大头针泡泡
    
}

#pragma mark 实现Yahoo代理协议
// 自定义弹出的泡泡
- (YMKAnnotationView *)mapView:(YMKMapView *)mapView viewForAnnotation:(id<YMKAnnotation>)annotation  {
    NSString *annotationIdentifier = @"customAnnotation";
    
    
    YMKPinAnnotationView *annotationview = [[YMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
    annotationview.image = [UIImage imageNamed:@"pin_red_s"];
    annotationview.animatesDrop = YES;
    
    return annotationview;
}

- (void)mapView:(YMKMapView *)mapView annotationView:(YMKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
}

- (void)mapView:(YMKMapView *)mapView beganPressWithCoordinate:(CLLocationCoordinate2D)coordinate {
    NSLog(@"点击地图");
}

- (void)mapView:(YMKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    NSLog(@"添加大头针");
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
