//
//  TRIntroViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/3/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRIntroViewController.h"
#import "TRIntroIndexCell.h"
#import "TRIntroViewModel.h"
#import "iCarousel.h"

@interface TRIntroViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, iCarouselDelegate, iCarouselDataSource>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) TRIntroViewModel *introVM;
@end

@implementation TRIntroViewController
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if (carousel.tag == kIntroIndexCellADICTag) {
        return self.introVM.indexNumber;
    }
    return 0;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (carousel.tag == kIntroIndexCellADICTag) {
        if (!view) {
            view = [[UIView alloc] initWithFrame:carousel.bounds];
            view.clipsToBounds = YES;
            UIImageView *iconIV = [UIImageView new];
            [view addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0);
            }];
            iconIV.contentMode = UIViewContentModeScaleAspectFill;
            iconIV.tag = 10000;
        }
        UIImageView *iconIV = (UIImageView *)[view viewWithTag:10000];
        [iconIV setImageWithURL:[self.introVM indexIconURLForIndex:index] placeholderImage:[UIImage imageNamed:@"分类"]];
        return view;
    }
    return nil;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (carousel.tag == kIntroIndexCellADICTag) {
        if (option == iCarouselOptionWrap) {
            return YES;
        }
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    if (carousel.tag == kIntroIndexCellADICTag) {
        NSInteger index = carousel.currentItemIndex;
        TRIntroIndexCell *cell = (TRIntroIndexCell *)[_collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        cell.titleLb.text = [self.introVM indexTitleForIndex:index];
        cell.pageControl.currentPage = index;
    }
}

#pragma mark - UICollectionView delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TRIntroIndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TRIntroIndexCell" forIndexPath:indexPath];
        cell.icDelegate = self;
        cell.pageControl.numberOfPages = self.introVM.indexNumber;
        cell.pageControl.currentPage = 0;
        cell.titleLb.text = [self.introVM indexTitleForIndex:indexPath.row];
        [cell.ic0 reloadData];
        [cell.ic1 reloadData];
        return cell;
    }
    return nil;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //0  748  416
    return CGSizeMake(kScreenW, kScreenW * 416/ 748 + 110);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

#pragma mark - Life Circle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"推荐_默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐_焦点"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[TRIntroIndexCell class] forCellWithReuseIdentifier:@"TRIntroIndexCell"];
        WK(weakSelf);
        [_collectionView addHeaderRefresh:^{
            [weakSelf.introVM getDataWithRequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.collectionView reloadData];
                }
                [weakSelf.collectionView endHeaderRefresh];
            }];
        }];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.backgroundColor = kBGColor;
    }
    return _collectionView;
}

- (TRIntroViewModel *)introVM {
    if(_introVM == nil) {
        _introVM = [[TRIntroViewModel alloc] init];
    }
    return _introVM;
}

@end
