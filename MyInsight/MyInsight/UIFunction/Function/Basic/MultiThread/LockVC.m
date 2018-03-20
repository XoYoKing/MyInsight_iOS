
//
//  LockVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/3/19.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "LockVC.h"

@interface LockVC ()

@property (nonatomic, strong) NSMutableArray *myMutableList;
//要运用atomic 线程安全 只能是相对安全 只有这个属性也会出现线程问题
@property (strong, nonatomic) NSMutableArray *myThreadList;
// 安全
@property (strong, atomic) NSLock *mylock;

@end

@implementation LockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"同步锁";
    
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
