//
//  AppDelegate.m
//  TGbabysingone
//
//  Created by LyMac on 16/12/20.
//  Copyright © 2016年 LyMac. All rights reserved.
//

#import "AppDelegate.h"
//键盘
#import "IQKeyboardManager.h"
#import "IQKeyboardReturnKeyHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //判断时候需要显示登录页面
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"hadShowLoginVC"];
    //键盘（三方）
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = NO;
    manager.enableAutoToolbar = NO;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    //查看多任务时候会触发
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    //进入后台运行时候会触发
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    //从后台重新进入应用会触发
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    //应用被杀死时候会触发
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"hadShowLoginVC"];
}


@end
