//
//  TRLoginViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRLoginViewController.h"
#import <TPKeyboardAvoidingTableView.h>
#import "TRLoginCell.h"
#import "TRRegisterViewController.h"

@interface TRLoginViewController ()
@property (nonatomic) UIView *headerView;
@property (nonatomic) UIView *footerView;
@end

@implementation TRLoginViewController
#pragma mark - Method List
- (void)setupLeftItem{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"关闭_默认"] style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    self.navigationItem.leftBarButtonItems = @[spaceItem, backItem];
}

- (void)setupRigthItem{
    UIBarButtonItem *registerItem = [[UIBarButtonItem alloc] bk_initWithTitle:@" 注册 " style:UIBarButtonItemStyleDone handler:^(id sender) {
        TRRegisterViewController *vc = [[TRRegisterViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    self.navigationItem.rightBarButtonItem = registerItem;
}

#pragma mark - Life Circle
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        [self setupLeftItem];
        [self setupRigthItem];
        self.title = @"登录";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    object_setClass(self.tableView, [TPKeyboardAvoidingTableView class]);
    self.tableView.backgroundColor = kBGColor;
    self.tableView.tableHeaderView = self.headerView;
    [self.tableView registerClass:[TRLoginCell class] forCellReuseIdentifier:@"TRLoginCell"];
    self.tableView.tableFooterView = self.footerView;
    self.tableView.allowsSelection = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRLoginCell" forIndexPath:indexPath];
    cell.textField.placeholder = @[@"请输入手机号", @"请输入密码"][indexPath.row];
    cell.textField.secureTextEntry = indexPath.row; //0假 1真, 是否显示密码
    cell.iconIV.image = [UIImage imageNamed:@[@"用户名", @"密码"][indexPath.row]];
    return cell;
}

#pragma mark - Lazy Load
- (UIView *)headerView {
    if(_headerView == nil) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
        _headerView.backgroundColor = kBGColor;
        UIImageView *iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"头像"]];
        [_headerView addSubview:iconIV];
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
    }
    return _headerView;
}

- (UIView *)footerView {
    if(_footerView == nil) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 60)];
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        loginBtn.backgroundColor = kNaviBarBGColor;
        loginBtn.layer.cornerRadius = 4;
        [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
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
            
            TRLoginCell *cell0 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            TRLoginCell *cell1 = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
            NSString *phoneNum = cell0.textField.text;
            NSString *pwd = cell1.textField.text;
            if (!(phoneNum.length == 11 && phoneNum.doubleValue > 10000000000)) {
                [self.view showWarning:@"请输入正确的手机号码"];
                return;
            }
            if (pwd.length == 0) {
                [self.view showWarning:@"请输入密码"];
                return;
            }
            pwd = [Factory md5:pwd];
            
            BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
            if (!isAutoLogin) {
                EMError *error = [[EMClient sharedClient] loginWithUsername:phoneNum password:pwd];
                if (!error)
                {
                    [[EMClient sharedClient].options setIsAutoLogin:YES];
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerView;
}

@end
