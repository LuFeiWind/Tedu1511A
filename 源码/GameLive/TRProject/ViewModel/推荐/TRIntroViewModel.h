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
- (NSString *)indexUidForIndex:(NSInteger)index;
/* 头部滚动广告部分--End */

@end
