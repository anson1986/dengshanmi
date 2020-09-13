//
//  BaseViewController.h
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UILabel *baseTitleLabel;

@property (nonatomic, copy) NSString *p_title;

@property (nonatomic, strong) UIButton *backItem;

- (void)backAction;

@end

NS_ASSUME_NONNULL_END
