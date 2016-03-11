//
//  TRChatViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRChatViewController.h"
#import "TRLoginViewController.h"
#import "TRFriendsViewController.h"
#import "TRAddFriendViewController.h"
#import "TRUserNameCell.h"
#import "TRFriendInvitationViewController.h"

@interface TRChatViewController ()

@end

@implementation TRChatViewController

#pragma mark - Life Circle
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        self.title = @"聊一聊";
        self.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_mainframeHL"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TRUserNameCell class] forCellReuseIdentifier:@"TRUserNameCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [EMClient sharedClient].isLoggedIn? 3 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 1 ? 4 : 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if ([EMClient sharedClient].isLoggedIn) {
            //个人信息
        }else{
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[[TRLoginViewController alloc] initWithStyle:UITableViewStylePlain]];
            [self presentViewController:navi animated:YES completion:nil];
        }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            
        }
        if (indexPath.row == 1) {
            TRFriendsViewController *friendsVC = [TRFriendsViewController new];
            [self.navigationController pushViewController:friendsVC animated:YES];
        }
        
        if (indexPath.row == 3) {
            TRFriendInvitationViewController *vc = [TRFriendInvitationViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        if (indexPath.row == 2) {
            //            TRAddFriendViewController *vc = [TRAddFriendViewController new];
            //            [self.navigationController pushViewController:vc animated:YES];
            UIAlertView *alertView = [[UIAlertView alloc] bk_initWithTitle:@"添加好友" message:@"请准确输入对方的手机号"];
            alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
            [alertView textFieldAtIndex:0].placeholder = @"请输入对方手机号码";
            [alertView textFieldAtIndex:0].keyboardType = UIKeyboardTypeNumberPad;
            [alertView bk_addButtonWithTitle:@"取消" handler:^{
            }];
            [alertView bk_addButtonWithTitle:@"确定" handler:^{
                NSString *phoneNum = [alertView textFieldAtIndex:0].text;
                if (![Factory isPhoneNumber:phoneNum]) {
                    [self.view showWarning:@"请输入正确的手机号码"];
                    return;
                }
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    EMError *error = [[EMClient sharedClient].contactManager addContact:phoneNum message:[[EMClient sharedClient].currentUsername stringByAppendingString:@"想要加您为好友"]];
                    if (!error) {
                        NSLog(@"添加成功");
                        [self.view showWarning:@"好友请求已发送!"];
                    }else{
                        [self.view showWarning:error.errorDescription];
                    }
                }];
            }];
            [alertView show];
        }
    }
    
    if (indexPath.section == 2) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            EMError *error = [[EMClient sharedClient] logout:YES];
            if (!error) {
                NSLog(@"退出成功");
                [self.view showWarning:@"退出登录成功"];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TRUserNameCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRUserNameCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSArray *itemNames = @[@"聊天记录", @"好友列表", @"添加好友", @"好友申请"];
    if (indexPath.section == 1) {
        cell.textLabel.text = itemNames[indexPath.row];
    }
    if (indexPath.section == 2) {
        cell.textLabel.text = @"退出登录";
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [EMClient sharedClient].isLoggedIn ? @"用户名" : @"登录账号";
        cell.detailTextLabel.text = [EMClient sharedClient].isLoggedIn ? [EMClient sharedClient].currentUsername : @"";
    }
    return cell;
}

@end
