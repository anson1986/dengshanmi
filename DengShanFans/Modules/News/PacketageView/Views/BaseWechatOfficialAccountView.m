//
//  BaseWechatOfficialAccountView.m
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import "BaseWechatOfficialAccountView.h"
#import "BaseOfficalAccountCell.h"

@interface BaseWechatOfficialAccountView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BaseWechatOfficialAccountView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
    }
    
    return self;
}

- (void)showView {
    self.backgroundColor = [UIColor orangeColor];
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = RGBValue(0x181818);
    self.tableView.sectionFooterHeight = 40.0f;
    [self addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}


#pragma mark -- UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseOfficalAccountCell *accountCell = [tableView dequeueReusableCellWithIdentifier:@"accountCell"];
    if (!accountCell) {
        accountCell = [[BaseOfficalAccountCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"accountCell"];
    }
    
    accountCell.model = self.listArray[indexPath.section];
    
    return accountCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 25;
    }
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 390.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UILabel new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}


@end
