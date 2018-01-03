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
    // 初始化百度地图
    [self setupBaiduMaps];
    
    // 设置根视图
    //[self setupRootController];
    
    MainRevealVC *mainRevealVC = [[MainRevealVC alloc] init];
    // 设置根视图
    self.window.rootViewController = mainRevealVC;
    // Window可见
    [self.window makeKeyAndVisible];
    
    return YES;
}

// 设置百度地图
- (void)setupBaiduMaps {
    
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
    
    [UIApplication sharedApplication].shortcutItems = @[homeItem, playItem, userItem];
}


- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    if ([shortcutItem.type isEqualToString:@"homeAnchor"]) {
        NSLog(@"主页页面");
    }
    if ([shortcutItem.type isEqualToString:@"playAnchor"]) {
        NSLog(@"播放页面");
    }
    if ([shortcutItem.type isEqualToString:@"userAnchor"]) {
        NSLog(@"个人用户");
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
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
