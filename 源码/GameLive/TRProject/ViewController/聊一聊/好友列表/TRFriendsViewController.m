//
//  TRFriendsViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRFriendsViewController.h"

@interface TRFriendsViewController ()
@property (nonatomic) NSArray *friends;
@end

@implementation TRFriendsViewController

#pragma mark - Life Circle

- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [[NSOperationQueue new] addOperationWithBlock:^{
            EMError *error = nil;
            weakSelf.friends = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
            if (!error) {
                NSLog(@"获取成功 -- %@",weakSelf.friends);
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.friends[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EaseMessageViewController *vc = [[EaseMessageViewController alloc] initWithConversationChatter:self.friends[indexPath.row] conversationType:EMConversationTypeChat];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
