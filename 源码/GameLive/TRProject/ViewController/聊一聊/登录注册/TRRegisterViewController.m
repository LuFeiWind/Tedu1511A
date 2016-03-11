//
//  TRRegisterViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRRegisterViewController.h"
#import "TRLoginCell.h"
#import <TPKeyboardAvoidingTableView.h>
#import "TRValidCodeCell.h"
#import <SMS_SDK/SMSSDK.h>

@interface TRRegisterViewController ()
@property (nonatomic) UIView *footerView;
@end

@implementation TRRegisterViewController
#pragma mark - Life Circle
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        self.title = @"注册";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    self.tableView.tableFooterView = self.footerView;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
    headerView.backgroundColor = kBGColor;
    self.tableView.tableHeaderView = headerView;
    self.tableView.backgroundColor = kBGColor;
    [self.tableView registerClass:[TRLoginCell class] forCellReuseIdentifier:@"TRLoginCell"];
    [self.tableView registerClass:[TRValidCodeCell class] forCellReuseIdentifier:@"TRValidCodeCell"];
    object_setClass(self.tableView, [TPKeyboardAvoidingTableView class]);
    self.tableView.allowsSelection = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < 2) {
        TRLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRLoginCell" forIndexPath:indexPath];
        cell.textField.placeholder = @[@"请输入手机号", @"请输入密码"][indexPath.row];
        cell.textField.secureTextEntry = indexPath.row; //0假 1真, 是否显示密码
        cell.iconIV.image = [UIImage imageNamed:@[@"用户名", @"密码"][indexPath.row]];
        return cell;
    }else{
        TRValidCodeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRValidCodeCell" forIndexPath:indexPath];
        cell.getValidCode = ^(){
            TRLoginCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            NSString *phoneNum = cell.textField.text;
            if (!(phoneNum.length == 11 && phoneNum.doubleValue > 10000000000)) {
                [self.view showWarning:@"请输入正确的手机号码"];
                return;
            }
            [self.view showBusyHUD];
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneNum zone:@"86" customIdentifier:@"" result:^(NSError *error) {
                [self.view hideBusyHUD];
                if (error) {
                    [self.view showWarning:error.localizedDescription];
                }else{
                    [self.view showWarning:@"验证码已发送"];
                }
            }];
        };
        return cell;
    }   
}

#pragma mark - Lazy Load
- (UIView *)footerView {
    if(_footerView == nil) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 60)];
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        loginBtn.backgroundColor = kNaviBarBGColor;
        loginBtn.layer.cornerRadius = 4;
        [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        loginBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_footerView addSubview:loginBtn];
        [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.left.equalTo(30);
            make.right.equalTo(-30);
            make.height.equalTo(44);
        }];
        [loginBtn bk_addEventHandler:^(id sender) {
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerView;
}

@end
