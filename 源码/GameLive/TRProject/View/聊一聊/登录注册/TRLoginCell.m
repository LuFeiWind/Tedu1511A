//
//  TRLoginCell.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRLoginCell.h"

@implementation TRLoginCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self iconIV];
        [self textField];
    }
    return self;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.size.equalTo(CGSizeMake(22, 22));
            make.centerY.equalTo(0);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconIV;
}


- (UITextField *)textField {
    if(_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.font = [UIFont systemFontOfSize:18];
//        _textField.borderStyle = UITextBorderStyleRoundedRect;
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-15);
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
        }];
    }
    return _textField;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
