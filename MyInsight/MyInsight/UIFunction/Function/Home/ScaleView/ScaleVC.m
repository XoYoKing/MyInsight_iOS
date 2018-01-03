//
//  ScaleVC.m
//  MyInsight
//
//  Created by SongMengLong on 2017/12/24.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import "ScaleVC.h"
#import <Masonry.h>

@interface ScaleVC ()

@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation ScaleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"等分布局";
    
}

- (void)viewDidLayoutSubviews {
   
}


- (void)viewLayoutMarginsDidChange {
    [super viewLayoutMarginsDidChange];
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
