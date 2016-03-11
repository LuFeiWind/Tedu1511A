//
//  TRFriendInvitationViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRFriendInvitationViewController.h"
#import "TRFriend.h"
#import "TRFriendInvitationCell.h"

@interface TRFriendInvitationViewController ()
@property (nonatomic) NSMutableArray *friends;
@end

@implementation TRFriendInvitationViewController

- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        self.title = @"好友申请";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TRFriendInvitationCell class] forCellReuseIdentifier:@"TRFriendInvitationCell"];
    self.tableView.tableFooterView = [UIView new];
    [Factory addBackItemToVC:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRFriendInvitationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRFriendInvitationCell" forIndexPath:indexPath];
    TRFriend *friend = self.friends[indexPath.row];
    cell.nameLb.text = friend.userName;
    cell.messageLb.text = friend.message;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TRFriend *friend = self.friends[indexPath.row];
    [UIAlertView bk_showAlertViewWithTitle:friend.userName message:friend.message cancelButtonTitle:@"取消" otherButtonTitles:@[@"拒绝", @"同意"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        [[NSOperationQueue new] addOperationWithBlock:^{
            if (buttonIndex == 1) { //拒绝
                EMError *error = [[EMClient sharedClient].contactManager declineInvitationForUsername:friend.userName];
                if (!error) {
                    NSLog(@"发送拒绝成功");
                    [self.view showWarning:@"已拒绝"];
                    [friend removeUser];
                    _friends = nil;
                    [self.tableView reloadData];
                }else{
                    [self.view showWarning:error.errorDescription];
                }
            }
            if (buttonIndex == 2) { //同意
                EMError *error = [[EMClient sharedClient].contactManager acceptInvitationForUsername:friend.userName];
                if (!error) {
                    NSLog(@"发送同意成功");
                    [self.view showWarning:@"已同意"];
                    [friend removeUser];
                    _friends = nil;
                    [self.tableView reloadData];
                }else{
                    [self.view showWarning:error.errorDescription];
                }
            }
        }];
        
    }];
}

- (NSMutableArray *)friends {
    if (!_friends) {
        _friends = [TRFriend getFriendInvatations];
    }
    return _friends;
}

@end
