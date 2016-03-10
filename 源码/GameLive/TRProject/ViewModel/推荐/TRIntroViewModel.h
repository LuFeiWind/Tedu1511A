//
//  TRIntroViewModel.h
//  TRProject
//
//  Created by jiyingxin on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "TRLiveNetManager.h"

@interface TRIntroViewModel : TRBaseViewModel

/* 头部滚动广告部分--Begin */
@property (nonatomic) NSArray *indexList;
@property (nonatomic) NSInteger indexNumber;
- (TRIntroMobileModel *)indexModelForIndex:(NSInteger)index;
- (NSURL *)indexIconURLForIndex:(NSInteger)index;
- (NSString *)indexTitleForIndex:(NSInteger)index;
- (NSURL *)indexURLForIndex:(NSInteger)index;
/* 头部滚动广告部分--End */

/* 明星部分--Begin */
@property (nonatomic) NSArray *starList;
@property (nonatomic) NSInteger starNumber;
- (NSString *)starNameForIndex:(NSInteger)index;
- (NSURL *)starIconURLForIndex:(NSInteger)index;
- (TRIntroMobileModel *)starModelForIndex:(NSInteger)index;
- (NSURL *)starVideoURLForIndex:(NSInteger)index;
/* 明星部分--End */

/* 推荐部分--Begin */
@property (nonatomic) NSInteger recommendNumber;
@property (nonatomic) NSArray *recommentList;
@property (nonatomic) NSArray *currentRecommendList;
/** 当前数据的起始索引值 */
@property (nonatomic) NSInteger recommendStartIndex;
- (void)changeCurrentRecommentList;
- (TRIntroMobileModel *)recommendModelForRow:(NSInteger)row;
- (NSURL *)recommendIconURLForRow:(NSInteger)row;
- (NSString *)recommendTitleForRow:(NSInteger)row;
- (NSString *)recommendNickForRow:(NSInteger)row;
- (NSString *)recommendViewForRow:(NSInteger)row;
- (NSURL *)recommendVideoURLForRow:(NSInteger)row;
/* 推荐部分--End*/


/* 其他游戏直播--Begin */
- (TRIntroLinkModel *)linkModelForRow:(NSIndexPath *)indexPath;
@property (nonatomic) NSInteger linkNumber;
@property (nonatomic) NSArray *linkList;
- (NSURL *)linkIconURLForRow:(NSIndexPath *)indexPath;
- (NSString *)linkTitleForRow:(NSIndexPath *)indexPath;
- (NSString *)linkNickForRow:(NSIndexPath *)indexPath;
- (NSString *)linkViewForRow:(NSIndexPath *)indexPath;
- (NSURL *)linkVideoURLForRow:(NSIndexPath *)indexPath;

/* 其他游戏直播--End */
@end















