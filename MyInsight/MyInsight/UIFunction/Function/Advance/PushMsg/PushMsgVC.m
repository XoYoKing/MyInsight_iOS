//
//  PushMsgVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/5/2.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "PushMsgVC.h"
#import <Masonry.h>
#import "UIColor+Category.h"

@interface PushMsgVC ()
// 远程推送
@property (nonatomic, strong) UIButton *remoteButton;
// 本地推送
@property (nonatomic, strong) UIButton *localButton;

@end

@implementation PushMsgVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推送消息";
    
    // 创建buttons
    [self creatButtonView];
    // 代码约束布局
    [self masonryLayout];
}

- (void)creatButtonView {
    // 远程推送
    self.remoteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.remoteButton];
    self.remoteButton.backgroundColor = [UIColor RandomColor];
    [self.remoteButton setTitle:@"远程推送" forState:UIControlStateNormal];
    [self.remoteButton addTarget:self action:@selector(remoteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    // 本地推送
    self.localButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.localButton];
    self.localButton.backgroundColor = [UIColor RandomColor];
    [self.localButton setTitle:@"本地推送" forState:UIControlStateNormal];
    [self.localButton addTarget:self action:@selector(localButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)remoteButtonAction:(UIButton *)button {
    NSLog(@"远程推送");
    
    
}

- (void)localButtonAction:(UIButton *)button {
    NSLog(@"本地推送");
    // 发送通知
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"" object:nil];
    
    // https://blog.csdn.net/BraveHeartKing/article/details/79355908
    //[iOS开发本地推送](https://www.cnblogs.com/xianfeng-zhang/p/8309252.html)
    
    
    // 1.创建通知
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    // 2.设置通知的必选参数
    // 设置通知显示的内容
    localNotification.alertBody = @"推送显示的信息";
    // 设置通知的发送时间,单位秒，在多少秒之后推送
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    //解锁滑动时的事件
    localNotification.alertAction = @"XXOOXX";
    //收到通知时App icon的角标
    localNotification.applicationIconBadgeNumber = 0;
    //推送是带的声音提醒，设置默认的字段为UILocalNotificationDefaultSoundName
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    //设置推送自定义声音格式
    //localNotification.soundName = @"文件名.扩展名";
    //循环次数
    localNotification.repeatInterval = kCFCalendarUnitDay;
    // 3.发送通知(根据项目需要使用)
    // 方式一: 根据通知的发送时间(fireDate)发送通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)masonryLayout {
    // 远程推送
    [self.remoteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.8f);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.4f);
        make.height.equalTo(self.remoteButton.mas_width).multipliedBy(0.4f);
    }];
    // 本地推送
    [self.localButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).multipliedBy(1.0f);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(1.2f);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.4f);
        make.height.equalTo(self.localButton.mas_width).multipliedBy(0.4f);
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
