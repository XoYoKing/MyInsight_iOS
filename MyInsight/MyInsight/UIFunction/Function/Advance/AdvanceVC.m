//
//  AdvanceVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/24.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "AdvanceVC.h"
#import <SWRevealViewController.h>
#import <Masonry.h>
#import "TouchIDVC.h" // TouchID
#import "MapsVC.h" // 地图
#import "PortraitScreenVC.h" // 竖屏
#import "ScaleVC.h" // 三等分约束布局
#import "BlueToothVC.h" // 蓝牙(系统)
#import "BabyBleVC.h" // 蓝牙(三方)
#import "MQTTVC.h"

@interface AdvanceVC ()<UITableViewDelegate, UITableViewDataSource>
// 列表
@property (nonatomic, strong) UITableView *tableView;
// 数组数据
@property (nonatomic, strong) NSArray *dataArray;

@end

// 定义字符串
const NSString *TouchIDStr = @"TouchID";
const NSString *MapsStr = @"地图";
const NSString *ScreenStr = @"横竖屏";
const NSString *ScaleStr = @"自动比例约束布局";
const NSString *BlueToothStr = @"蓝牙(系统)";
const NSString *BabyBLEStr = @"蓝牙(三方)";
const NSString *MQTTStr = @"MQTT";

@implementation AdvanceVC

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
    
    // 左右button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"左边" style:UIBarButtonItemStylePlain target:[self revealViewController] action:@selector(revealToggle:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStylePlain target:[self revealViewController] action:@selector(rightRevealToggle:)];
    
    // 处理数据
    [self handleTableViewData];
    // 创建列表
    [self creatTableView];
    // 代码约束布局
    [self masonryLayoutSubview];
}

// 处理数据
- (void)handleTableViewData {
    self.dataArray = @[TouchIDStr, MapsStr, BlueToothStr, BabyBLEStr, ScreenStr, ScaleStr, MQTTStr];
}

#pragma mark - 创建TableView
- (void)creatTableView {
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    // 设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // 清空多余cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    // 注册cell
    //[self.tableView registerNib:[UINib nibWithNibName:@"MineCell" bundle:nil] forCellReuseIdentifier:@"MineCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

#pragma mark - 实现TableView的代理协议
// section个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// section中cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

// 生成cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    if (cell == nil) {
        //cell = [[[NSBundle mainBundle]loadNibNamed:@"MineCell" owner:self options:nil] lastObject];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    // 赋值
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

// 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取字符串
    NSString *cellString = [self.dataArray objectAtIndex:indexPath.row];
    
    // 设置返回button的样式
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    if ([cellString isEqual:TouchIDStr]) {
        // TouchID
        TouchIDVC *touchIDVC = [[TouchIDVC alloc] init];
        touchIDVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:touchIDVC animated:YES];
    }
    if ([cellString isEqual:MapsStr]) {
        //  地图
        MapsVC *mapsVC = [[MapsVC alloc] init];
        mapsVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mapsVC animated:YES];
    }
    if ([cellString isEqual:ScreenStr]) {
        // 横竖屏
        PortraitScreenVC *portraitScreenVC = [[PortraitScreenVC alloc] init];
        portraitScreenVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:portraitScreenVC animated:YES];
    }
    if ([cellString isEqual:ScaleStr]) {
        // 等分布局
        ScaleVC *scaleVC = [[UIStoryboard storyboardWithName:@"Home" bundle:NULL] instantiateViewControllerWithIdentifier:@"ScaleVC"];
        scaleVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:scaleVC animated:YES];
    }
    if ([cellString isEqual:BlueToothStr]) {
        // 蓝牙(系统)
        BlueToothVC *blueToothVC = [[BlueToothVC alloc] init];
        blueToothVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:blueToothVC animated:YES];
    }
    if ([cellString isEqual:BabyBLEStr]) {
        // 蓝牙(三方)
        BabyBleVC *babyBleVC = [[BabyBleVC alloc] init];
        babyBleVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:babyBleVC animated:YES];
    }
    if ([cellString isEqual:MQTTStr]) {
        // MQTT
        MQTTVC *mqttVC = [[MQTTVC alloc] init];
        mqttVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:mqttVC animated:YES];
    }
}

#pragma mark - 代码约束布局
- (void)masonryLayoutSubview {
    // TableView
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0.0f);
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
