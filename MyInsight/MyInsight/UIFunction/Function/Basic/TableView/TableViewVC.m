//
//  TableViewVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/2/1.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "TableViewVC.h"
#import <Masonry.h> // 代码约束布局

@interface TableViewVC ()
// TableView
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"TableView";
    self.view.backgroundColor = [UIColor whiteColor];
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
