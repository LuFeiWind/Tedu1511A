//
//  TRValidCodeCell.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRValidCodeCell.h"

@implementation TRValidCodeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self validBtn];
        [self textField];
    }
    return self;
}

- (UIButton *)validBtn {
    if(_validBtn == nil) {
        _validBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_validBtn];
        [_validBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-15);
            make.size.equalTo(CGSizeMake(80, 30));
        }];
        _validBtn.backgroundColor = kNaviBarBGColor;
        _validBtn.layer.cornerRadius = 4;
        [_validBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_validBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_validBtn bk_addEventHandler:^(UIButton *sender) {
            sender.enabled = NO;
            __block NSInteger duration = 59;
            sender.backgroundColor = [UIColor darkGrayColor];
            [sender setTitle:@"60" forState:UIControlStateNormal];
            [NSTimer bk_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
                [sender setTitle:@(duration--).stringValue forState:UIControlStateNormal];
                if (duration == 0) {
                    [timer invalidate];
                    sender.enabled = YES;
                    sender.backgroundColor = kNaviBarBGColor;
                    [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
                }
            } repeats:YES];
            self.getValidCode();
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _validBtn;
}

- (UITextField *)textField {
    if(_textField == nil) {
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.right.equalTo(_validBtn.mas_left).equalTo(-8);
            make.centerY.equalTo(0);
        }];
        _textField.placeholder = @"请输入验证码";
    }
    return _textField;
}

@end
