//
//  BaseViewController.m
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseBgView];
}

- (void)setupBaseBgView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    //title
    self.baseTitleLabel = [UILabel new];
    self.baseTitleLabel.frame = CGRectMake(0, 0, WindowWidth != 320 ? 200 : 150, 21);
    self.baseTitleLabel.textAlignment = NSTextAlignmentCenter;
    self.baseTitleLabel.backgroundColor = [UIColor clearColor];
    self.baseTitleLabel.font = [UIFont systemFontOfSize:17];
//    self.titleLabel.text = self.p_title;
    self.baseTitleLabel.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.baseTitleLabel;
    
    //backItem
    self.backItem = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backItem.frame = CGRectMake(0, 0, 30, 30);
    [self.backItem setTitleColor:RGBValue(0x000000) forState:UIControlStateNormal];
    [self.backItem setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
    self.backItem.imageEdgeInsets = UIEdgeInsetsMake(0, -13, 0, 0);
    [self.backItem addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backItem];
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setP_title:(NSString *)p_title {
    _p_title = p_title;
    self.baseTitleLabel.text = _p_title;
}

@end
