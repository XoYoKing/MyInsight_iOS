//
//  MarkdownView.m
//  MyInsight
//
//  Created by SongMengLong on 2018/9/30.
//  Copyright © 2018 SongMenglong. All rights reserved.
//

#import "MarkdownView.h"
#import <WebKit/WebKit.h>

@interface MarkdownView ()

// 声明网页
@property (nonatomic, strong) WKWebView *webView;

@end


@implementation MarkdownView



- (void)load:(NSString *)markdown enableImage:(NSString *)enableImage {
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
