//
//  DrawBaseVC.h
//  MyInsight
//
//  Created by SongMenglong on 2018/5/3.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseVC.h"

@interface DrawBaseVC : BaseVC
// red view
@property (weak, nonatomic) UIView *redView;

- (Class)drawViewClass;

@end
