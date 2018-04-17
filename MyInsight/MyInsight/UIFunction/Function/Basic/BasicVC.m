//
//  BasicVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/24.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "BasicVC.h"
#import <SWRevealViewController.h>
#import <Masonry.h>

#import "LiftCycleVC.h" // 生命周期
#import "RunTimeVC.h" // 运行时
#import "AnimationVC.h"
#import "DataBaseVC.h"
#import "TableViewVC.h"
#import "CollectionViewVC.h"
#import "RadioButtonVC.h"
#import "MultiThreadVC.h" //多线程
#import "CYuYanVC.h"

@interface BasicVC ()<UITableViewDelegate, UITableViewDataSource>

// LEFT
@property (nonatomic, strong) UIBarButtonItem *leftBarButtonItem;
// RIGHT
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;

// 列表
@property (nonatomic, strong) UITableView *tableView;
// 数组数据
@property (nonatomic, strong) NSArray *dataArray;

@end

const NSString *LiftCycleStr = @"VC生命周期";
const NSString *RunTimeStr = @"运行时RunTime";
const NSString *ShouShiStr = @"手势";
const NSString *XieYiStr = @"协议";
const NSString *AnimationStr = @"动画";
const NSString *TableViewStr = @"TableView";
const NSString *CollectViewStr = @"CollectView";
const NSString *DataBaseStr = @"数据库";
const NSString *radioButtonStr = @"单选按钮🔘 基本表单";
const NSString *MultiThreadString = @"多线程";
const NSString *numberString = @"";
const NSString *CYuYanString = @"C语言";

/*
 */

@implementation BasicVC

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
    self.dataArray = @[CYuYanString, LiftCycleStr, RunTimeStr, ShouShiStr, XieYiStr, AnimationStr, TableViewStr, CollectViewStr, DataBaseStr, radioButtonStr, MultiThreadString];
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

// section中cell个数
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

// 选中cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取到当前cell的字符串
    NSString *cellString = [self.dataArray objectAtIndex:indexPath.row];
    // 设置返回button的样式
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];  
    
    if ([cellString isEqual:CYuYanString]) {
        // C语言
        CYuYanVC *cYuYanVC = [[CYuYanVC alloc] init];
        cYuYanVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:cYuYanVC animated:YES];
    }
    
    if ([cellString isEqual:LiftCycleStr]) {
        // 生命周期
        LiftCycleVC *liftCycleVC = [[LiftCycleVC alloc] init];
        liftCycleVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:liftCycleVC animated:YES];
    }
    
    if ([cellString isEqual:RunTimeStr]) {
        // 运行时
        RunTimeVC *runTimeVC = [[RunTimeVC alloc] init];
        runTimeVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:runTimeVC animated:YES];
    }
    if ([cellString isEqual:AnimationStr]) {
        // 动画
        AnimationVC *animationVC = [[AnimationVC alloc] init];
        animationVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:animationVC animated:YES];
    }
    if ([cellString isEqual:TableViewStr]) {
        // TableView
        TableViewVC *tableViewVC = [[TableViewVC alloc] init];
        tableViewVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:tableViewVC animated:YES];
    }
    if ([cellString isEqual:CollectViewStr]) {
        //CollectionView
        CollectionViewVC *collectionViewVC = [[CollectionViewVC alloc] init];
        collectionViewVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:collectionViewVC animated:YES];
    }
    if ([cellString isEqual:DataBaseStr]) {
        // 数据库
        DataBaseVC *dataBaseVC = [[DataBaseVC alloc] init];
        dataBaseVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:dataBaseVC animated:YES];
    }
    if ([cellString isEqual:radioButtonStr]) {
        // 单选button
        RadioButtonVC *radioButtonVC = [[RadioButtonVC alloc] init];
        radioButtonVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:radioButtonVC animated:YES];
    }
    if ([cellString isEqual:MultiThreadString]) {
        // 多线程
        MultiThreadVC *multiThreadVC = [[MultiThreadVC alloc] init];
        multiThreadVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:multiThreadVC animated:YES];
    }
    
}

#pragma mark 代码约束布局
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
