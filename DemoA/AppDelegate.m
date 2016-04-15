//
//  AppDelegate.m
//  DemoA
//
//  Created by 曾源琛 on 16/4/15.
//  Copyright © 2016年 zengyuanchen. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYCMagnifierViewController.h"
#import "ZYCSeekViewController.h"
#import "ZYCScratchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    ZYCMagnifierViewController *magnifierCtl = [[ZYCMagnifierViewController alloc] init];
    magnifierCtl.title = @"放大镜";
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:magnifierCtl];
    
    
    ZYCSeekViewController *seekCtl = [[ZYCSeekViewController alloc] init];
    seekCtl.title = @"遮罩";
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:seekCtl];
    
    ZYCScratchViewController *scratchCtl = [[ZYCScratchViewController alloc] init];
    scratchCtl.title = @"刮除";
    UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:scratchCtl];
    
    
    UITabBarController *tabbarCtl = [[UITabBarController alloc] init];
    tabbarCtl.viewControllers = @[navi1,navi2,navi3];
    
    self.window.rootViewController = tabbarCtl;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
