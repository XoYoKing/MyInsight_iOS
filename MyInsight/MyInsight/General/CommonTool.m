//
//  CommonTool.m
//  MyInsight
//
//  Created by SongMenglong on 2018/1/26.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool

// 随机颜色
+ (UIColor *)RandomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}


@end