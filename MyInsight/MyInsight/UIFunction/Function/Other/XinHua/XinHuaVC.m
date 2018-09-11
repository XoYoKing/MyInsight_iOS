//
//  XinHuaVC.m
//  MyInsight
//
//  Created by SongMengLong on 2018/7/30.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "XinHuaVC.h"
#import <AFNetworking/AFNetworking.h>
#import "HTTPTOOL.h"
#import <Masonry.h>

@interface XinHuaVC ()

@property (nonatomic, strong) UIButton *typeButton;
// 输入框
@property (nonatomic, strong) UITextField *inputTextField;
// 展示
@property (nonatomic, strong) UITextView *outputTextView;

@end

@implementation XinHuaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"中华新华字典";
 
    // 创建子控件
    [self creatUIViews];
    // 代码约束布局
    [self masonryLayoutSubViews];
    // 处理数据
    [self handleData];
}

#pragma mark - 创建子控件
- (void)creatUIViews {
    self.inputTextField = [[UITextField alloc] init];
    [self.view addSubview:self.inputTextField];
    self.inputTextField.backgroundColor = [UIColor orangeColor];
    
    self.outputTextView = [[UITextView alloc] init];
    [self.view addSubview:self.outputTextView];
    self.outputTextView.backgroundColor = [UIColor purpleColor];
    self.outputTextView.editable = NO;
}

#pragma mark - 代码约束布局
- (void)masonryLayoutSubViews {
    [self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(80.0f);
        make.left.equalTo(self.view.mas_left).offset(40.0f);
        make.right.equalTo(self.view.mas_right).offset(-40.0f);
        make.height.offset(40.0f);
    }];
    
    [self.outputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.inputTextField.mas_bottom).offset(20.0f);
        make.left.equalTo(self.view.mas_left).offset(40.0f);
        make.right.equalTo(self.view.mas_right).offset(-40.0f);
        make.bottom.equalTo(self.view.mas_bottom).offset(-40.0f);
    }];
}

#pragma mark - 处理数据
- (void)handleData {
    // 中华新华字典数据库 开源API：https://github.com/pwxcoo/chinese-xinhua
    [HTTPTOOL GETWithURL:@"https://www.pwxcoo.com/dictionary" body:@{@"type":@"word", @"word":@"龙"} httpHead:nil resoponseStyle:JSON success:^(id result) {
        NSLog(@"%@", result);
        self.outputTextView.text = [NSString stringWithFormat:@"%@", result];
    } fail:^(NSError *error) {
        NSLog(@"%@", error);
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
