//
//  RunTimeVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/26.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "RunTimeVC.h"

@interface RunTimeVC ()

// 输出
@property (weak, nonatomic) UITextView *inputTextView;

@end

@implementation RunTimeVC

#pragma mark - 运行时
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"运行时";
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
