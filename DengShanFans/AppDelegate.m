//
//  AppDelegate.m
//  DengShanFans
//
//  Created by bifen on 2020/7/4.
//  Copyright © 2020 obj. All rights reserved.
//

#import "AppDelegate.h"
#import "DSLaunchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    DSLaunchViewController *vc = [DSLaunchViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
