//
//  TRAddFriendViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRAddFriendViewController.h"

@interface TRAddFriendViewController ()<UISearchBarDelegate>
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) NSMutableArray *dataList;
@end

@implementation TRAddFriendViewController

#pragma mark - UISearchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSString *words = searchBar.text;
    [searchBar resignFirstResponder];
    if (words.length == 0) {
        [self.view showWarning:@"请输入对方电话号码"];
        return;
    }
    
}

#pragma mark - Life Circle
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:style]) {
        _searchBar = [UISearchBar new];
        _searchBar.delegate = self;
        self.navigationItem.titleView = _searchBar;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (NSMutableArray *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray alloc] init];
    }
    return _dataList;
}

@end
