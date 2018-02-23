//
//  DataBaseVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/2/1.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "DataBaseVC.h"
#import <Masonry.h> //代码约束布局

@interface DataBaseVC ()
// SQLite
@property (nonatomic, strong) UIButton *sqliteButton;
// Realm
@property (nonatomic, strong) UIButton *realmButton;
// CocoaData
@property (nonatomic, strong) UIButton *cocoaDataButton;
// 创建
@property (nonatomic, strong) UIButton *creatButton;
// 更新
@property (nonatomic, strong) UIButton *updateButton;
// 读取
@property (nonatomic, strong) UIButton *readButton;
// 删除
@property (nonatomic, strong) UIButton *deleteButton;
// 输出View
@property (nonatomic, strong) UITextView *outputTextView;

@end

@implementation DataBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"数据库";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
    
    [self masonrySubView];
}

#pragma mark - 创建UI
- (void)creatUI {
    
    self.sqliteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.sqliteButton];
    self.sqliteButton.backgroundColor = [UIColor grayColor];
    [self.sqliteButton setTitle:@"SQLite" forState:UIControlStateNormal];
    
    self.realmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.realmButton];
    self.realmButton.backgroundColor = [UIColor grayColor];
    [self.realmButton setTitle:@"Realm" forState:UIControlStateNormal];
    
    self.cocoaDataButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.cocoaDataButton];
    self.cocoaDataButton.backgroundColor = [UIColor grayColor];
    [self.cocoaDataButton setTitle:@"CocoaData" forState:UIControlStateNormal];
    
    self.creatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.creatButton];
    
    self.updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.updateButton];
    
    self.readButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.readButton];
    
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.deleteButton];
    
    self.creatButton.backgroundColor = [UIColor redColor];
    [self.creatButton setTitle:@"创建" forState:UIControlStateNormal];
    
    self.updateButton.backgroundColor = [UIColor redColor];
    [self.updateButton setTitle:@"更新" forState:UIControlStateNormal];
    
    self.readButton.backgroundColor = [UIColor redColor];
    [self.readButton setTitle:@"读取" forState:UIControlStateNormal];
    
    self.deleteButton.backgroundColor = [UIColor redColor];
    [self.deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    
    self.outputTextView = [[UITextView alloc] init];
    [self.view addSubview:self.outputTextView];
    self.outputTextView.backgroundColor = [UIColor orangeColor];
}

#pragma mark - 代码约束布局
- (void)masonrySubView {
    // 不同的数据库
    [self.sqliteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(0.5f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.4f);
    }];
    
    [self.realmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.4f);
    }];
    
    [self.cocoaDataButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.5f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.4f);
    }];
    
    // CURD按钮
    [self.creatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(0.4f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.6f);
    }];
    
    [self.updateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(0.8f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.6f);
    }];
    
    [self.readButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.2f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.6f);
    }];
    
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.6f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.6f);
    }];
    
    [self.outputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.creatButton.mas_bottom).offset(11.0f);
        make.left.equalTo(self.view.mas_left).offset(0.0f);
        make.right.equalTo(self.view.mas_right).offset(0.0f);
        make.bottom.equalTo(self.view.mas_bottom).offset(0.0f);
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
