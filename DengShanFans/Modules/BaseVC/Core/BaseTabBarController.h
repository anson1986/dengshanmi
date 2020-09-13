//
//  BaseTabBarController.h
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarController : UITabBarController

@property (nonatomic, strong) NSMutableArray *items;

- (void)setupControllers;

- (void)setupDatas;

@end

NS_ASSUME_NONNULL_END
