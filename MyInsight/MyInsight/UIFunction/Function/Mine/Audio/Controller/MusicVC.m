//
//  MusicVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/19.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "MusicVC.h"
#import <AVFoundation/AVFoundation.h>

@interface MusicVC ()
//播放器
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation MusicVC

/*
 初始化对象
 设置播放器属性
 调用播放器
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"音乐";
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
