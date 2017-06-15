//
//  AppDelegate.m
//  Tpod
//
//  Created by 卢杨 on 17/3月/3.
//  Copyright © 2017年 卢杨. All rights reserved.
//
#import "MMsectionTableViewController.h"
#import "QMUIConfigurationTemplate.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import <WeexSDK/WeexSDK.h>
#import "WeexObjc.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [QMUIConfigurationTemplate setupConfigurationTemplate];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MMsectionTableViewController *tabbar = [[MMsectionTableViewController alloc] init];
    UINavigationController *na = [[UINavigationController alloc]initWithRootViewController:tabbar];
 
    self.window.rootViewController = na;
    [self.window makeKeyAndVisible];
    
    [WXSDKEngine initSDKEnvironment];
    [WXSDKEngine registerHandler:[WeexObjc new] withProtocol:@protocol(WXImgLoaderProtocol)];// 注册图片下载操作
    
    return YES;
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
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSString* prefix = @"wpfWidgetTest://action=";
    NSString *urlString = [url absoluteString];
    NSLog(@">>>>>>>>   %@",urlString);
    if ([urlString rangeOfString:prefix].location != NSNotFound) {
        NSString *action = [urlString substringFromIndex:prefix.length];
        if ([action isEqualToString:@"richScan"]) {
            // 进入到扫一扫页面
            
               NSLog(@">>>>>>>>进入到扫一扫页面进入到扫一扫页面" );
            //[self.rootVC transferToRichScanVC];
        } else if ([action isEqualToString:@"web"]) {
            // 进入到 web 活动页
           // [self.rootVC transferToWebVCWithUrlString:@"webTest"];
        }
    }
    return  YES;
}

@end
