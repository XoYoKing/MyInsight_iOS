//
//  TabBarVC.m
//  MyInsight
//
//  Created by SongMenglong on 2017/12/1.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import "TabBarVC.h"

#import "HomeTableVC.h"
#import "MarkTableVC.h"
#import "MineVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 主页
    HomeTableVC *homeTableVC = [[HomeTableVC alloc] init];
    UINavigationController *homeTableNavi = [[UINavigationController alloc] initWithRootViewController:homeTableVC];
    // 书签
    MarkTableVC *markTableVC = [[MarkTableVC alloc] init];
    UINavigationController *markTableNAvi = [[UINavigationController alloc] initWithRootViewController:markTableVC];
    // 个人
    MineVC *mineVC = [[MineVC alloc] init];
    UINavigationController *mineNavi = [[UINavigationController alloc] initWithRootViewController:mineVC];
    // 设置各个tabbar
    homeTableVC.tabBarItem.image = [UIImage imageNamed:@"home_nor"];
    homeTableVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_sel"];
    homeTableVC.tabBarItem.title = @"主页";
    markTableVC.tabBarItem.image = [UIImage imageNamed:@"mark_nor"];
    markTableVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mark_sel"];
    markTableVC.tabBarItem.title = @"地图";
    mineVC.tabBarItem.image = [UIImage imageNamed:@"mine_nor"];
    mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"mine_sel"];
    mineVC.tabBarItem.title = @"个人";
    
    // 设置tabbar
    [self setViewControllers:@[homeTableNavi, markTableNAvi, mineNavi] animated:YES];
    //[self setViewControllers:@[homeTableVC, markTableVC, mineVC] animated:YES];
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
