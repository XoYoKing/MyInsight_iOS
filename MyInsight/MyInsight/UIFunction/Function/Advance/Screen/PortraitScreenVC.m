//
//  PortraitScreenVC.m
//  MyInsight
//
//  Created by SongMenglong on 2017/12/2.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import "PortraitScreenVC.h"
#import <Masonry.h>
#import "LandscapeScreenVC.h" // 横屏

@interface PortraitScreenVC ()

@property (nonatomic, strong) UIButton *nextButton;

@end

@implementation PortraitScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 竖屏
    self.title = @"竖屏";
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.nextButton];
    [self.nextButton setTitle:@"横屏页面" forState:UIControlStateNormal];
    self.nextButton.backgroundColor = [UIColor blueColor];
    [self.nextButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(1.0f);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.50f);
        make.height.equalTo(self.view.mas_width).multipliedBy(0.25f);
    }];
}

- (void)buttonAction:(UIButton *)button {
    LandscapeScreenVC *twoVC = [[LandscapeScreenVC alloc] init];
    
    UINavigationController *twoNavi = [[UINavigationController alloc] initWithRootViewController:twoVC];
    // 模态推出
    [self presentViewController:twoNavi animated:NO completion:NULL];
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
