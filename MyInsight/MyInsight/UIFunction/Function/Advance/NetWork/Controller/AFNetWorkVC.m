
//
//  AFNetWorkVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/4/17.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "AFNetWorkVC.h"
#import <AFNetworking/AFNetworking.h>
#import "HTTPTOOL.h"

@interface AFNetWorkVC ()


@end

@implementation AFNetWorkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"AFNET网络请求";
    
    [self handleAFNetWorkData];
}

#pragma mark - 处理网络数据
- (void)handleAFNetWorkData {
    NSLog(@"处理网络数据。。。。。");
    // https://www.windblew.cn/index/index/dearMeng
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 设置解析 使用第三方工具
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];
    
    [manager GET:@"https://www.windblew.cn/index/index/dearMeng" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功了--%@--%@", [responseObject class], responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败了--%@", error);
    }];
    
    // 第三方工具再封装 自定义的轮子
    [HTTPTOOL GETWithURL:@"https://www.windblew.cn/index/index/dearMeng" body:nil httpHead:nil resoponseStyle:JSON success:^(id result) {
        NSLog(@"成功了又如何？：%@", result);
    } fail:^(NSError *error) {
        NSLog(@"失败了又怎样？：%@", error);
    }];
    
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
