//
//  SoundVC.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/19.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "SoundVC.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SoundVC ()

@end

@implementation SoundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"音效";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self playSoundEffect:@""];
}


- (void)playSoundEffect:(NSString *)name {
    
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
