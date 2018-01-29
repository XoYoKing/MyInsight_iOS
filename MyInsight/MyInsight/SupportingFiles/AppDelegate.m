//
//  AppDelegate.m
//  MyInsight
//
//  Created by SongMenglong on 2017/11/30.
//  Copyright © 2017年 SongMenglong. All rights reserved.
//

#import "AppDelegate.h"
#import "MainRevealVC.h" // 主页面


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    
    // 设置3D Touch功能
    [self setup3DTouch];
    
    // 设置根视图
    //[self setupRootController];
    
    MainRevealVC *mainRevealVC = [[MainRevealVC alloc] init];
    // 设置根视图
    self.window.rootViewController = mainRevealVC;
    // Window可见
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark - 设置3Dtouch功能
- (void)setup3DTouch {
    // 3DTouch实用演练 http://www.sohu.com/a/200417763_208051
    UIApplicationShortcutIcon *homeIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose];
    UIApplicationShortcutItem *homeItem = [[UIApplicationShortcutItem alloc] initWithType:@"homeAnchor" localizedTitle:@"首页" localizedSubtitle:@"" icon:homeIcon userInfo:nil];
    
    UIApplicationShortcutIcon *playIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePlay];
    UIApplicationShortcutItem *playItem = [[UIApplicationShortcutItem alloc] initWithType:@"playAnchor" localizedTitle:@"播放" localizedSubtitle:@"" icon:playIcon userInfo:nil];
    
    UIApplicationShortcutIcon *userIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutItem *userItem = [[UIApplicationShortcutItem alloc] initWithType:@"userAnchor" localizedTitle:@"用户" localizedSubtitle:@"" icon:userIcon userInfo:nil];
    
    // UIApplicationShortcutIconTypeShare
    UIApplicationShortcutIcon *shareIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    UIApplicationShortcutItem *shareItem = [[UIApplicationShortcutItem alloc] initWithType:@"shareAnchor" localizedTitle:@"用户" localizedSubtitle:@"" icon:shareIcon userInfo:nil];
    
    [UIApplication sharedApplication].shortcutItems = @[homeItem, playItem, userItem, shareItem];
}

// 3D Touch响应
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    // 3D Touch
    if ([shortcutItem.type isEqualToString:@"homeAnchor"]) {
        NSLog(@"主页页面");
    }
    if ([shortcutItem.type isEqualToString:@"playAnchor"]) {
        NSLog(@"播放页面");
    }
    if ([shortcutItem.type isEqualToString:@"userAnchor"]) {
        NSLog(@"个人用户");
    }
    if ([shortcutItem.type isEqualToString:@"shareAnchor"]) {
        NSLog(@"分享用户啊");
    }
}

#pragma mark - 设置根视图
- (void)setupRootController {
    // TabbarNavi
    UINavigationController *tabbarNavi = [[UIStoryboard storyboardWithName:@"Main" bundle:NULL] instantiateViewControllerWithIdentifier:@"MainVC"];
    // 设置根视图
    self.window.rootViewController = tabbarNavi;
}

#pragma mark - 横竖屏切换
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if (self.isSupportHori) {
        return UIInterfaceOrientationMaskLandscapeRight;
    }else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
    
}


@end
