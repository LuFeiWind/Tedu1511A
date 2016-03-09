//
//  TRIntroSecionHeaderView.m
//  TRProject
//
//  Created by jiyingxin on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRIntroSectionHeaderView.h"

@implementation TRIntroSectionHeaderView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *lineView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"栏目标题"]];
        [self addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(3, 20));
        }];
        [self addSubview:self.titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lineView.mas_right).equalTo(8);
            make.centerY.equalTo(lineView);
        }];
        
        UIControl *rightC = [self changeControl];
        [self addSubview:rightC];
        [rightC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(100, 20));
        }];
    }
    return self;
}

- (UIControl *)moreControl{
    return nil;
}

- (UIControl *)changeControl{
    UIControl *rightC = [UIControl new];
    [rightC bk_addEventHandler:^(id sender) {
        if ([_delegate respondsToSelector:@selector(introSectionHeaderView:clickBtnAtIndexPath:)]) {
            [_delegate introSectionHeaderView:self clickBtnAtIndexPath:_indexPath];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
    rightC.backgroundColor = [UIColor greenColor];
    
    
    
    return rightC;
}


- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
    }
    return _titleLb;
}

@end
