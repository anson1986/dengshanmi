//
//  BaseNewsCell.m
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import "BaseNewsCell.h"

@interface BaseNewsCell ()

@property (nonatomic, strong) UIView *lineView;

@end

@implementation BaseNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self lineView];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [self iconImgView];
        [self titleLabel];
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

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.1f];
        [self addSubview:_lineView];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(25);
            make.bottom.equalTo(self).offset(0);
            make.right.equalTo(self).offset(-65);
            make.height.mas_offset(1);
        }];
    }
    return _lineView;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImgView.layer.masksToBounds = YES;
        [self addSubview:_iconImgView];
        
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-25);
            make.centerY.equalTo(self);
            make.width.height.mas_offset(62);
        }];
    }
    
    return _iconImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.numberOfLines = 2;
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineView);
            make.right.equalTo(self.iconImgView.mas_left).offset(-8);
            make.height.mas_offset(42);
            make.centerY.equalTo(self);
        }];
    }
    
    return _titleLabel;
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    if (indexPath.row == 2) {
        self.lineView.hidden = YES;
    }else {
        self.lineView.hidden = NO;
    }
}

@end
