//
//  ReferToVC.m
//  MyInsight
//
//  Created by SongMengLong on 2018/9/24.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "ReferToVC.h"
#import <Masonry.h>
#import "ReferToWebVC.h"

@interface ReferToVC ()<UITableViewDelegate, UITableViewDataSource>
// 列表
@property (nonatomic, strong) UITableView *tableView;
// 数据
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ReferToVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"借鉴参考";
    
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
    //[self.tableView registerNib:[UINib nibWithNibName:@"MineCell" bundle:nil] forCellReuseIdentifier:@"MineCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ReferToVC"];
    
    // 处理数据
    [self handleData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReferToVC" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ReferToVC"];
    }
    
    // 赋值
    cell.textLabel.text = [self.dataArray[indexPath.row] valueForKey:@"name"];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取cell的字符串
    NSString *cellString = [[self.dataArray objectAtIndex:indexPath.row] valueForKey:@"url"];
    NSLog(@"选中cell %@", cellString);
    // 打开链接
    ReferToWebVC *referToWebVC = [[ReferToWebVC alloc] init];
    referToWebVC.htmlString = cellString;
    [self.navigationController pushViewController:referToWebVC animated:YES];
}

#pragma mark - 处理数据
- (void)handleData {
    // 数据
    self.dataArray = @[
                       // GitHub仓库地址
                       @{@"name":@"本仓库地址",
                         @"url":@"https://github.com/MagnumSong/MyInsight_iOS"},
                       @{@"name":@"iOS面试题",
                         @"url":@"https://github.com/ChenYilong/iOSInterviewQuestions"},
                       @{@"name":@"iOSProject",
                         @"url":@"https://github.com/NJHu/iOSProject"},
                       @{@"name":@"wiftProject",
                         @"url":@"https://github.com/NJHu/swiftProject"},
                       @{@"name":@"新华字典API",
                         @"url":@"https://github.com/pwxcoo/chinese-xinhua"},
                       @{@"name":@"天天生鲜源代码1",
                         @"url":@"https://github.com/xaincai/dailyfresh"},
                       @{@"name":@"天天生鲜源代码2",
                         @"url":@"https://github.com/shihao1010/tiantianshengxian"},
                       // 博客 文章 技术
                       @{@"name":@"iOS网络—UIWebView、WKWebView使用详解",
                         @"url":@"https://www.jianshu.com/p/556c988e2707"},
                       @{@"name":@"iOS 组件化方案探索",
                         @"url":@"https://blog.cnbang.net/tech/3080/"},
                       @{@"name":@"FMDB 在多线程中的使用",
                         @"url":@"https://blog.csdn.net/zhangao0086/article/details/44223007"},
                       @{@"name":@"IOS:FMDB使用databaseQueue实现数据库操作线程安全",
                         @"url":@"https://blog.csdn.net/qishiai819/article/details/51394303"},
                       @{@"name":@"iOS模式详解runtime面试工作",
                         @"url":@"http://www.cocoachina.com/special/20170623/19628.html"},
                       @{@"name":@"CoreFoundation框架详细解析（二） —— 设计概念",
                         @"url":@"https://www.jianshu.com/p/2361f1221576"},
                       // Python
                       @{@"name":@"django+nginx+uwsgi部署（及遇到的错误）",
                         @"url":@"http://www.shihao.online/detail/19/"},
                       // 小程序
                       @{@"name":@"使用AUI框架开发微信小程序",
                         @"url":@"https://blog.csdn.net/u013176571/article/details/71171925"},
                       @{@"name":@"APICloud",
                         @"url":@"https://docs.apicloud.com/APICloud/junior-develop-guide"},
                       // 面试
                       @{@"name":@"sunnyxx:招聘一个靠谱的 iOS",
                         @"url":@"http://blog.sunnyxx.com/2015/07/04/ios-interview/"},
                       @{@"name":@"2018 iOS 社招面试经验：我是如何拿到阿里、滴滴、美团等六家 offer 的？ ",
                         @"url":@"https://xiaozhuanlan.com/topic/4985160237"},
                       @{@"name":@"芒果iOS开发之高级面试题二",
                         @"url":@"https://blog.csdn.net/crazyzhang1990/article/details/50405627"},
                       @{@"name":@"iOS高级面试之面试题集",
                         @"url":@"https://blog.csdn.net/shifang07/article/details/79130794"},
                       @{@"name":@"2017年iOS面试题整理",
                         @"url":@"https://www.jianshu.com/p/665e218c6ec1"},
                       // iOS面试题
                       @{@"name":@"iOS中的多线程技术",
                         @"url":@"http://xuyafei.cn/post/draft/ios-thread"},
                       @{@"name":@"iOS 中级面试题",
                         @"url":@"http://mrpeak.cn/ios/2016/01/07/push"},
                       @{@"name":@"知乎上的一个怎么面试iOS工程师的问题",
                         @"url":@"https://blog.csdn.net/hanangellove/article/details/45033453"},
                       
                       ];
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
