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
#import "RunLoopVC.h"
#import "TableViewVC.h"
#import "CollectionViewVC.h"
#import "RadioButtonVC.h"
#import "MultiThreadVC.h" //多线程
#import "CYuYanVC.h"
#import "PortraitScreenVC.h" // 竖屏
#import "ViewLayoutVC.h"
#import "CoreAnimationVC.h" // 核心动画
#import "PhysicalVC.h"

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

static const NSString *LiftCycleStr = @"VC生命周期";
static const NSString *RunTimeStr = @"运行时RunTime";
static const NSString *ShouShiStr = @"手势";
static const NSString *XieYiStr = @"协议";
static const NSString *TableViewStr = @"TableView";
static const NSString *CollectViewStr = @"CollectView";
static const NSString *RadioButtonStr = @"单选按钮🔘 基本表单";
static const NSString *MultiThreadString = @"多线程";
static const NSString *CYuYanString = @"C语言";
static const NSString *RunLoopString = @"RunLoop";
static const NSString *ScreenStr = @"横竖屏";
static const NSString *ViewLayoutStr = @"约束布局";
static const NSString *CoreAnimationStr = @"核心动画";
static const NSString *PhysicalStr = @"物理仿真";

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
    // 数组
    self.dataArray = @[CYuYanString, LiftCycleStr, RunTimeStr, RunLoopString, ShouShiStr, XieYiStr, PhysicalStr, CoreAnimationStr, TableViewStr, CollectViewStr, RadioButtonStr, ScreenStr, MultiThreadString, ViewLayoutStr];
}

#pragma mark - 创建TableView
- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
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
    return 3;
}

// section中cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.dataArray.count;
    } else {
        return 0;
    }
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
    if ([cellString isEqual:RunLoopString]) {
        // RunLoop
        RunLoopVC *runLoopVC = [[RunLoopVC alloc] init];
        runLoopVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:runLoopVC animated:YES];
    }
    if ([cellString isEqual:PhysicalStr]) {
        // 物理仿真
        PhysicalVC *physicalVC = [[PhysicalVC alloc] init];
        physicalVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:physicalVC animated:YES];
    }
    if ([cellString isEqual:CoreAnimationStr]) {
        // 核心动画
        CoreAnimationVC *coreAnimationVC = [[CoreAnimationVC alloc] init];
        coreAnimationVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:coreAnimationVC animated:YES];
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
    if ([cellString isEqual:RadioButtonStr]) {
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
    if ([cellString isEqual:ScreenStr]) {
        // 横竖屏
        PortraitScreenVC *portraitScreenVC = [[PortraitScreenVC alloc] init];
        portraitScreenVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:portraitScreenVC animated:YES];
    }
    if ([cellString isEqual:ViewLayoutStr]) {
        // 约束布局
        ViewLayoutVC *viewLayoutVC = [[ViewLayoutVC alloc] init];
        viewLayoutVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewLayoutVC animated:YES];
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
