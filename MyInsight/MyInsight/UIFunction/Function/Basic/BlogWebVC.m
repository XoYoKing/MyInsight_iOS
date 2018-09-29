//
//  BlogWebVC.m
//  MyInsight
//
//  Created by SongMengLong on 2018/9/29.
//  Copyright © 2018 SongMenglong. All rights reserved.
//

#import "BlogWebVC.h"
#import <WebKit/WebKit.h>

@interface BlogWebVC ()

@end

@implementation BlogWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载本地html
    [self useWKWebView];
    
}


- (void)useWKWebView {
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.htmlStr withExtension:@"html"];
    NSLog(@"%@", url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    WKWebView * webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:request];
    [self.view addSubview:webView];
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
