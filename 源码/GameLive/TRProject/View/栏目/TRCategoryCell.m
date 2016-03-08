//
//  TRCategoryCell.m
//  TRProject
//
//  Created by jiyingxin on 16/3/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRCategoryCell.h"

@implementation TRCategoryCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.clipsToBounds = YES;
        self.clipsToBounds=YES;
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"分类"]];
        self.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        UIView *whiteV = [UIView new];
        whiteV.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:whiteV];
        //28 + 2
        [whiteV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
        [self iconIV];
        [self titleLb];
    }
    return self;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(-3);
        }];
        _titleLb.font = [UIFont systemFontOfSize:16];
    }
    return _titleLb;
}

- (UILabel *)viewLb {
    if(_viewLb == nil) {
        _viewLb = [[UILabel alloc] init];
        _viewLb.textColor = [UIColor whiteColor];
        _viewLb.font = [UIFont systemFontOfSize:12];
    }
    return _viewLb;
}

- (UILabel *)nickLb {
    if(_nickLb == nil) {
        _nickLb = [[UILabel alloc] init];
        _nickLb.textColor = [UIColor whiteColor];
        _nickLb.font = [UIFont systemFontOfSize:12];
    }
    return _nickLb;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.bottom.equalTo(-30);
        }];
        
        UIView *lightV = [[UIView alloc] init];
        lightV.backgroundColor = kRGBA(0, 0, 0, 0.6);
        [_iconIV addSubview:lightV];
        [lightV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(20);
        }];
        
        UIImageView *icon0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"主播名"]];
        [lightV addSubview:icon0];
        [icon0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(2);
            make.centerY.equalTo(0);
        }];
        
        [lightV addSubview:self.nickLb];
        [self.nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon0.mas_right).equalTo(2);
            make.centerY.equalTo(0);
            make.width.lessThanOrEqualTo(lightV.mas_width).dividedBy(2);
        }];
        
        [lightV addSubview:self.viewLb];
        [self.viewLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-2);
        }];
        
        UIImageView *icon1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"观看人数"]];
        [lightV addSubview:icon1];
        [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(self.viewLb.mas_left).equalTo(-2);
        }];
    }
    return _iconIV;
}

@end
