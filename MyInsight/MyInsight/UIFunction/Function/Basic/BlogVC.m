//
//  BlogVC.m
//  MyInsight
//
//  Created by SongMengLong on 2018/9/29.
//  Copyright © 2018 SongMenglong. All rights reserved.
//

#import "BlogVC.h"
#import <Masonry.h>
#import "BlogWebVC.h"

@interface BlogVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
// 数据
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation BlogVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"博客";
    
    self.dataArray = @[@"model", @"算法", @"runtime", @"runloop", @"block", @"多线程"];
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0.0f);
        make.left.equalTo(self.view.mas_left).offset(0.0f);
        make.right.equalTo(self.view.mas_right).offset(0.0f);
        make.bottom.equalTo(self.view.mas_bottom).offset(0.0f);
    }];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // 清空多余cell
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    // 注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"BlogVC"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BlogVC" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BlogVC"];
    }
    
    // 赋值
    cell.textLabel.text = self.dataArray[indexPath.row];//
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取cell的字符串
    NSString *cellString = [self.dataArray objectAtIndex:indexPath.row];
    NSLog(@"选中cell %@", cellString);
    // 打开链接
    BlogWebVC *blogWebVC = [[BlogWebVC alloc] init];
    blogWebVC.htmlStr = cellString;
    [self.navigationController pushViewController:blogWebVC animated:YES];
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
