//
//  TRCategoryViewModel.h
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "TRLiveNetManager.h"


@interface TRCategoryViewModel : TRBaseViewModel

- (id)initWithSlug:(NSString *)slug;
@property (nonatomic) NSString *slug;

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSMutableArray *roomList;

@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger pageCount;
@property (nonatomic) NSInteger size;
@property (nonatomic) NSInteger total;

- (TRCategoryDataModel *)modelForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)nickForRow:(NSInteger)row;
- (NSString *)viewForRow:(NSInteger)row;
- (NSURL *)videoURLForRow:(NSInteger)row;
@end
