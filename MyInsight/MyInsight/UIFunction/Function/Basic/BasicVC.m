//
//  BasicVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/24.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "BasicVC.h"
#import <Masonry.h>

@interface BasicVC ()<UITableViewDelegate, UITableViewDataSource>
// 列表
@property (nonatomic, strong) UITableView *tableView;
// 数组数据
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation BasicVC

/*
 生命周期
 
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 处理数据
    [self handleTableViewData];
    // 创建列表
    [self creatTableView];
}

// 处理数据
- (void)handleTableViewData {
    
}

#pragma mark - 创建TableView
- (void)creatTableView {
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    // 设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

#pragma mark - 实现TableView的代理协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

// 生成cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return NULL;
}

// 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
