//
//  TRCategoryViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRCategoryViewController.h"
#import "TRCategoryViewModel.h"
#import "TRCategoryCell.h"

@import AVFoundation;
@import AVKit;

#define kCellSpace          8
#define kCellNumPerLine     2

@interface TRCategoryViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic) TRCategoryViewModel *categoryVM;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@end

@implementation TRCategoryViewController
#pragma mark - UICollectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoryVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TRCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.categoryVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"分类"]];
    cell.titleLb.text = [self.categoryVM titleForRow:indexPath.row];
    cell.viewLb.text = [self.categoryVM viewForRow:indexPath.row];
    cell.nickLb.text = [self.categoryVM nickForRow:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    AVPlayerViewController *vc = [AVPlayerViewController new];
    AVPlayer *player = [AVPlayer playerWithURL:[self.categoryVM videoURLForRow:indexPath.row]];
    vc.player = player;
    [vc.player play];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - Life Circle
- (instancetype)initWithSlug:(NSString *)slug categoryName:(NSString *)categoryName{
    if (self = [self init]) {
        self.slug = slug;
        self.categoryName = categoryName;
        self.title = categoryName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView beginHeaderRefresh];
    [Factory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Lazy Load
- (TRCategoryViewModel *)categoryVM {
    if(_categoryVM == nil) {
        _categoryVM = [[TRCategoryViewModel alloc] initWithSlug:_slug];
    }
    return _categoryVM;
}

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
        [_collectionView addHeaderRefresh:^{
            [weakSelf.categoryVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
                if (weakSelf.categoryVM.page + 1 >= weakSelf.categoryVM.pageCount) {
                    [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        
        [_collectionView addBackFooterRefresh:^{
            [weakSelf.categoryVM getDataWithRequestMode:RequestModeMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }else{
                    [weakSelf.view showWarning:error.localizedDescription];
                }
                if (weakSelf.categoryVM.page + 1 >= weakSelf.categoryVM.pageCount) {
                    [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                }else{
                    [weakSelf.collectionView endFooterRefresh];
                }
                
            }];
        }];
        
        [_collectionView registerClass:[TRCategoryCell class] forCellWithReuseIdentifier:@"Cell"];
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



@end
