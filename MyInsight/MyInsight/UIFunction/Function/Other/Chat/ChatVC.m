//
//  ChatVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/3/26.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "ChatVC.h"
#import <Masonry.h>
#import "ChatTextCell.h"
#import "ChatImageCell.h"
#import "ChatAudioCell.h"
#import "ChatVideoCell.h"
#import "ChatTipCell.h"
#import "ChatFileCell.h"

@interface ChatVC ()

@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"隔壁王大叔";
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
