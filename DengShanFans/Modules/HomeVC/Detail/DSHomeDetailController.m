//
//  DSHomeDetailController.m
//  DengShanFans
//
//  Created by bifen on 2020/7/8.
//  Copyright © 2020 obj. All rights reserved.
//

#import "DSHomeDetailController.h"
#import "BaseBriefView.h"

@interface DSHomeDetailController ()

@property (nonatomic, strong) BaseBriefView *briefView;
@property (nonatomic, strong) NSDictionary *contentDict;

@end

@implementation DSHomeDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBgView];
}

- (void)setupBgView {
    self.briefView = [[BaseBriefView alloc] init]; [self.view addSubview:self.briefView];
    [self.briefView mas_makeConstraints:^(MASConstraintMaker *make) { make.edges.equalTo(self.view);
    }];
    [self.briefView showView];
    self.contentDict = @{@"img":self.model.iconImg,@"content":self.model.desc};
    self.briefView.showDict = self.contentDict;
}

- (void)setModel:(HYHomeModel *)model {
    _model = model;
    
    
    [self.briefView reloadData];
}

@end
