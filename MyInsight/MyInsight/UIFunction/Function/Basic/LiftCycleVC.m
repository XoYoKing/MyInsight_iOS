//
//  LiftCycleVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/25.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "LiftCycleVC.h"
#import <Masonry.h>

@interface LiftCycleVC ()
// 输出
@property (weak, nonatomic) UITextView *inputTextView;

@end

@implementation LiftCycleVC

- (void)loadView {
    [super loadView];
    
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"生命周期";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

// 打印输出函数
- (void)life:(const char *)fun {
    
}

// inputTextView的getter方法
- (UITextView *)inputTextView {
    if (self.inputTextView == NULL) {
        UITextView *textView = [[UITextView alloc] init];
        [self.view addSubview:textView];
        // 代码约束布局
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    
    return self.inputTextView;
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
