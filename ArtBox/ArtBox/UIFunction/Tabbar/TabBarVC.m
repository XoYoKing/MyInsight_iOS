
//
//  TabBarVC.m
//  ArtBox
//
//  Created by SongMenglong on 2018/3/9.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "TabBarVC.h"
#import "JinShiVC.h"
#import "ShuFaVC.h"
#import "TaoCiVC.h"
#import "YouHuaVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupTabbarVC];
}

#pragma mark 设置Tabbar
- (void)setupTabbarVC {
    
    //
    // 金石
    JinShiVC *jinshiVC = [[JinShiVC alloc] init];
    jinshiVC.tabBarItem.image = [UIImage imageNamed:@"home_nor"];
    jinshiVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_sel"];
    jinshiVC.tabBarItem.title = @"基础";
    jinshiVC.title = jinshiVC.tabBarItem.title;
    UINavigationController *basicNavi = [[UINavigationController alloc] initWithRootViewController:jinshiVC];
    
    // 书法
    ShuFaVC *shufaVC = [[ShuFaVC alloc] init];
    shufaVC.tabBarItem.image = [UIImage imageNamed:@"mark_nor"];
    shufaVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mark_sel"];
    shufaVC.tabBarItem.title = @"进阶";
    shufaVC.title = shufaVC.tabBarItem.title;
    UINavigationController *advanceNavi = [[UINavigationController alloc] initWithRootViewController:shufaVC];
    // 陶瓷
    TaoCiVC *taociVC = [[TaoCiVC alloc] init];
    taociVC.tabBarItem.image = [UIImage imageNamed:@"mine_nor"];
    taociVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mine_sel"];
    taociVC.tabBarItem.title = @"高级";
    taociVC.title = taociVC.tabBarItem.title;
    UINavigationController *seniorNavi = [[UINavigationController alloc] initWithRootViewController:taociVC];
    // 油画
    YouHuaVC *youhuaVC = [[YouHuaVC alloc] init];
    youhuaVC.tabBarItem.image = [UIImage imageNamed:@"setting_nor"];
    youhuaVC.tabBarItem.selectedImage = [UIImage imageNamed:@"setting_sel"];
    youhuaVC.tabBarItem.title = @"其他";
    youhuaVC.title = youhuaVC.tabBarItem.title;
    UINavigationController *otherNavi = [[UINavigationController alloc] initWithRootViewController:youhuaVC];
    
    // 设置徽标
    [youhuaVC.navigationController.tabBarItem setBadgeValue:@"2"];
    
    // 设置tabbar
    [self setViewControllers:@[basicNavi, advanceNavi, seniorNavi, otherNavi] animated:YES];
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
