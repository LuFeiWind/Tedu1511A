//
//  TRValidCodeCell.h
//  TRProject
//  验证码
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRValidCodeCell : UITableViewCell

@property (nonatomic) UITextField *textField;
@property (nonatomic) UIButton *validBtn;

@property (nonatomic, copy) void(^getValidCode)();

- (void)showWaitingStyle;
@end
