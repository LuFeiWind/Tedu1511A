//
//  TRChatViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRChatViewController.h"
#import "TRLoginViewController.h"

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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [[EMClient sharedClient] bk_addObserverForKeyPath:@"isLogin" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
        NSLog(@"change %@", change);
        [self.tableView reloadData];
    }];
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
    return section == 1 ? 3 : 1;
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
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSArray *itemNames = @[@"聊天记录", @"好友列表", @"添加好友"];
    if (indexPath.section == 1) {
        cell.textLabel.text = itemNames[indexPath.row];
    }
    if (indexPath.section == 2) {
        cell.textLabel.text = @"退出登录";
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [EMClient sharedClient].isLoggedIn ? @"个人信息" : @"登录账号";
    }
    return cell;
}

@end
