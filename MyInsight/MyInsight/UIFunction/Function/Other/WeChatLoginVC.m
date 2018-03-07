
//
//  WeChatLoginVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/3/7.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "WeChatLoginVC.h"
#import <WXApi.h> // 微信头文件
#import <Masonry.h>

@interface WeChatLoginVC ()

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation WeChatLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WeChat";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(1.0f);
        make.width.offset(100.0);
        make.height.offset(60.0f);
    }];
    self.loginButton.backgroundColor = [UIColor blueColor];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    
    [self.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginButtonAction:(UIButton *)button {
    NSLog(@"WeChat Login Action");
    if ([WXApi isWXAppInstalled]) {
        // 是否安装了微信
        NSLog(@"安装了微信");
        SendAuthReq *req = [[SendAuthReq alloc] init];
        req.scope = @"";
        req.state = @"";
        
        [WXApi sendReq:req];
    } else {
        NSLog(@"没有安装微信");
    }
    
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
