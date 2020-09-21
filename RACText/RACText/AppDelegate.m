//
//  AppDelegate.m
//  RACText
//
//  Created by step_zhang on 2020/9/14.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController * mainVC = [[MainViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - 生命周期
- (void)applicationWillEnterForeground:(UIApplication *)application{
    ZWWLog(@"状态** 将要进入前台");
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    ZWWLog(@"状态** 已经活跃");
}
- (void)applicationWillResignActive:(UIApplication *)application{
    ZWWLog(@"状态** 将要进入后台");
}
- (void)applicationDidEnterBackground:(UIApplication *)application{
    ZWWLog(@"状态** 已经进入后台");
}
- (void)applicationWillTerminate:(UIApplication *)application{
    ZWWLog(@"状态** 将要退出程序");
}


@end
