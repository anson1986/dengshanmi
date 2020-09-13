
//
//  DSTabBarController.m
//  DengShanFans
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 obj. All rights reserved.
//

#import "DSTabBarController.h"

@interface DSTabBarController ()

@end

@implementation DSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setupDatas {
    self.items = @[@"首页",@"新闻",@"知识"].mutableCopy;
}

- (void)setupControllers {
    DSHomeViewController *homeVC = [DSHomeViewController new];
    DSNavigationController *homeNavi = [[DSNavigationController alloc] initWithRootViewController:homeVC];
    
    DSNewsViewController *newsVC = [DSNewsViewController new];
    DSNavigationController *newsNavi = [[DSNavigationController alloc] initWithRootViewController:newsVC];
    
    DSKnowledgeViewController *knowledgeVC = [DSKnowledgeViewController new];
    DSNavigationController *knowledgeNavi = [[DSNavigationController alloc] initWithRootViewController:knowledgeVC];
    
    self.viewControllers = @[homeNavi,newsNavi,knowledgeNavi];
}

@end
