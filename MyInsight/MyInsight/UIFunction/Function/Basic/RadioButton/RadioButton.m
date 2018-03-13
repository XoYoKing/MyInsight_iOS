//
//  RadioButton.m
//  MyInsight
//
//  Created by SongMenglong on 2018/3/13.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "RadioButton.h"

@implementation RadioButton

#pragma mark - 重写初始化方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupContentUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContentUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupContentUI];
    }
    return self;
}

#pragma mark - 初始化UI
- (void)setupContentUI {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
