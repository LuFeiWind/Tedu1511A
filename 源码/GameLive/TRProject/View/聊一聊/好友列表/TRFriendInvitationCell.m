//
//  TRFriendInvitationCell.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRFriendInvitationCell.h"

@implementation TRFriendInvitationCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self nameLb];
        [self messageLb];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UILabel *)messageLb {
    if(_messageLb == nil) {
        _messageLb = [[UILabel alloc] init];
        _messageLb.numberOfLines = 0;
        [self.contentView addSubview:_messageLb];
        _messageLb.font = [UIFont systemFontOfSize:14];
        [_messageLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(-5);
            make.top.equalTo(self.nameLb.mas_top).equalTo(5);
        }];
    }
    return _messageLb;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(5);
            make.height.equalTo(22);
        }];
    }
    return _nameLb;
}


@end
