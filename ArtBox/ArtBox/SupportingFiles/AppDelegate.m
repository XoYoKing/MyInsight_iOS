//
//  AppDelegate.m
//  ArtBox
//
//  Created by SongMenglong on 2018/3/9.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeVC.h" // 欢迎页面
#import "TabBarVC.h" //

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    // Window可见
    [self.window makeKeyAndVisible];
    
    //第一次启动
    [self isFirstLaunched];
    
    return YES;
}

#pragma mark 是否第一次启动
- (void)isFirstLaunched {
    /*
     若是第一次加载 进入欢迎页面 若不是直接进入主页面
     */
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (![userDefaults stringForKey:@"LauchAgree"]) {
        // 设置值
        [userDefaults setValue:@"sd" forKey:@"LauchAgree"];
        NSLog(@"第一次启动");
        // 欢迎页
        WelcomeVC *welcomeVC = [[WelcomeVC alloc] init];
        // 设置根视图
        self.window.rootViewController = welcomeVC;
        
    } else {
        TabBarVC *mainRevealVC = [[TabBarVC alloc] init];
        // 设置根视图
        self.window.rootViewController = mainRevealVC;
        NSLog(@"不是第一次启动");
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
