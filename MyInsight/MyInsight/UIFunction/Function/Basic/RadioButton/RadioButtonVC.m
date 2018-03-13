//
//  RadioButtonVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/3/13.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "RadioButtonVC.h"
#import "RadioButton.h"
#import <Masonry.h>

@interface RadioButtonVC ()

@property (nonatomic, strong) RadioButton *testButton;

@end

@implementation RadioButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"单选🔘";
    
    self.view.backgroundColor =  [UIColor whiteColor];
    
    self.testButton = [RadioButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.testButton];
    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(1.0f);
        make.left.equalTo(self.view.mas_left).offset(40.0f);
        make.right.equalTo(self.view.mas_right).offset(-35.0f);
        make.height.offset(40.0f);
    }];
    
    //self.testButton.backgroundColor = [UIColor blueColor];
    [self.testButton setImage:[UIImage imageNamed:@"selectoff_btn"] forState:UIControlStateNormal];
    [self.testButton setImage:[UIImage imageNamed:@"selecton_btn"] forState:UIControlStateSelected];
    
    [self.testButton setTitle:@"滚滚长江东逝水" forState:UIControlStateNormal];
    
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
