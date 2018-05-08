//
//  RightRevealVC.m
//  MyInsight
//
//  Created by SongMenglong on 2017/12/1.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import "RightRevealVC.h"
#import <Masonry.h>
#import "UIColor+Category.h"

@interface RightRevealVC ()
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// 关于我
@property (nonatomic, strong) UILabel *aboutMeLabel;
// 邮箱地址
@property (nonatomic, strong) UILabel *emailLabel;
// 内容
@property (nonatomic, strong) UITextView *contentTestView;

@end

@implementation RightRevealVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor RandomColor]; // 设置背景颜色
    
    [self creatContentView];
    
    [self masonryLayout];
}

- (void)creatContentView {;
    
    self.titleLabel = [[UILabel alloc] init];
    [self.view addSubview:self.titleLabel];
    self.titleLabel.text = @"关于我";
    
    self.aboutMeLabel = [[UILabel alloc] init];
    [self.view addSubview:self.aboutMeLabel];
    self.aboutMeLabel.text = @"尘世迷茫程序员，汇集百家来开源。感谢大神写得好，俺们只是搬搬砖。";
    self.aboutMeLabel.numberOfLines = 0;
    
    self.emailLabel = [[UILabel alloc] init];
    [self.view addSubview:self.emailLabel];
    self.emailLabel.numberOfLines = 0;
    self.emailLabel.text = @"有事请联系：983174628@qq.com";
    
    // 鸣谢
    
    // 借鉴的仓库
}

- (void)masonryLayout {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.bottom.equalTo(self.aboutMeLabel.mas_top).offset(-20.0f);
        make.width.offset(200.0f);
    }];
    
    [self.aboutMeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.7f);
        make.width.offset(200.0f);
    }];
    
    [self.emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.top.equalTo(self.aboutMeLabel.mas_bottom).offset(10.0f);
        make.width.offset(200.0f);
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
