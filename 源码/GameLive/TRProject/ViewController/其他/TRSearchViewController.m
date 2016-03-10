//
//  TRSearchViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRSearchViewController.h"
#import "TRSearchViewModel.h"
#import "TRCategoryCell.h"
#define kCellSpace          8
#define kCellNumPerLine     2


@interface TRSearchViewController ()<UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) TRSearchViewModel *searchVM;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation TRSearchViewController
#pragma mark - UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.searchVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TRCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.searchVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"分类"]];
    cell.titleLb.text = [self.searchVM titleForRow:indexPath.row];
    cell.viewLb.text = [self.searchVM viewForRow:indexPath.row];
    cell.nickLb.text = [self.searchVM nickForRow:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [Factory playVideo:[self.searchVM videoURLForRow:indexPath.row]];
}


#pragma mark - Method List
- (void)search{
    [_searchBar resignFirstResponder];
    NSString *words = _searchBar.text;
    if (words.length == 0) {
        [self.view showWarning:@"请输入搜索内容"];
        return;
    }
    self.searchVM.words = words;
    [self.view showBusyHUD];
    [self.searchVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
        [self.view hideBusyHUD];
        if (!error) {
            [_collectionView reloadData];
            if (!self.searchVM.isHasMore) {
                [_collectionView endFooterRefreshWithNoMoreData];
            }
        }
    }];
}

#pragma mark - UISearchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self search];
}

#pragma mark - Life Circle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
        _searchBar = [UISearchBar new];
        self.navigationItem.titleView = _searchBar;
        _searchBar.placeholder = @"请输入关键词搜索";
        _searchBar.delegate = self;
        [Factory addSearchItemToVC:self clickHandler:^{
            [self search];
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.view.backgroundColor = kBGColor;
    [Factory addBackItemToVC:self];
    [self collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Lazy Load
- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = kBGColor;
        WK(weakSelf);
        [_collectionView addBackFooterRefresh:^{
            [weakSelf.searchVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                    if (weakSelf.searchVM.hasMore) {
                        [weakSelf.collectionView endFooterRefresh];
                    }else{
                        [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                    }
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
            }];
        }];
        
        [_collectionView registerClass:[TRCategoryCell class] forCellWithReuseIdentifier:@"Cell"];
        
        //没有搜索内容时的空显示
        UIImageView *iconIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索无结果"]];
        _collectionView.backgroundView = iconIV;
        iconIV.contentMode = UIViewContentModeCenter;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if(_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.sectionInset = UIEdgeInsetsMake(kCellSpace, kCellSpace, kCellSpace, kCellSpace);
        _flowLayout.minimumLineSpacing = kCellSpace;
        _flowLayout.minimumInteritemSpacing = kCellSpace;
        CGFloat width = (kScreenW - (kCellNumPerLine + 1) * kCellSpace)/kCellNumPerLine;
        //        350 * 266
        CGFloat height = 266 * width / 350;
        _flowLayout.itemSize = CGSizeMake(width, height);
    }
    return _flowLayout;
}

- (TRSearchViewModel *)searchVM {
    if(_searchVM == nil) {
        _searchVM = [[TRSearchViewModel alloc] init];
    }
    return _searchVM;
}

@end
