
//
//  DSLaunchViewController.m
//  DengShanFans
//
//  Created by bifen on 2020/7/8.
//  Copyright © 2020 obj. All rights reserved.
//

#import "DSLaunchViewController.h"
#import "LaunchView.h"
#import "DSTabBarController.h"

@interface DSLaunchViewController ()

@property (nonatomic, strong) NSMutableArray *pictureArray;

@end

@implementation DSLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBgView];
    [self showAnimation];
}

- (void)setupBgView {
    LaunchView *vc = [[LaunchView alloc] init];
    vc.title = @"登   山   迷";
    vc.subTitle = @"Mountaineering";
    vc.bgColor = MainColor;
    vc.fontColor = [UIColor whiteColor];
    vc.pictureArray = self.pictureArray;
    [self.view addSubview:vc];
    [vc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [vc showView];
}

- (void)showAnimation {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DSTabBarController *tab = [[DSTabBarController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = tab;
    });
}

- (NSMutableArray *)pictureArray {
    if (!_pictureArray) {
        _pictureArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 8; i ++) {
            NSString *picName = [NSString stringWithFormat:@"deng_launch_%ld",(long)i];
            [_pictureArray addObject:picName];
        }
    }
    
    return _pictureArray;
}

@end
