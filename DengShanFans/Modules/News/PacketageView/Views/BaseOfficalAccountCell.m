//
//  BaseOfficalAccountCell.m
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import "BaseOfficalAccountCell.h"
#import "BaseNewsCell.h"

@interface BaseOfficalAccountCell ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *headImgView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *contentList;

@end

@implementation BaseOfficalAccountCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self bgView];
        [self headImgView];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = RGBValue(0x242424);
        _bgView.layer.cornerRadius = 5.0f;
        [self addSubview:_bgView];
        
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.top.bottom.equalTo(self).offset(0);
        }];
        
        [self tableView];
    }
    
    return _bgView;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WindowWidth - 2*15, 150)];
        _headImgView.contentMode = UIViewContentModeScaleAspectFill;
        _headImgView.layer.masksToBounds = YES;
        [self.bgView addSubview:_headImgView];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_headImgView.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(5.0f,5.0f)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _headImgView.bounds;
        maskLayer.path = maskPath.CGPath;
        _headImgView.layer.mask = maskLayer;

    }
    
    return _headImgView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        _tableView.scrollEnabled = NO;
        [self.bgView addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImgView.mas_bottom).offset(0);
            make.left.right.bottom.equalTo(self.bgView).offset(0);
        }];
    }
    
    return _tableView;
}

#pragma mark -- UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseNewsCell *newsCell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (!newsCell) {
        newsCell = [[BaseNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
    }
    
    if (self.contentList) {
        NSString *iconName = self.contentList[indexPath.row][@"icon"];
        newsCell.iconImgView.image = [UIImage imageNamed:iconName];
        NSString *title = self.contentList[indexPath.row][@"desc"];
        newsCell.titleLabel.text = title;
    }

    return newsCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)setModel:(BaseOfficalAccountModel *)model {
    _model = model;
    self.headImgView.image = [UIImage imageNamed:model.headImgView];
    self.contentList = model.detailArray;
}

- (NSMutableArray *)contentList {
    if (!_contentList) {
        _contentList = [[NSMutableArray alloc] init];
    }
    return _contentList;
}

@end
