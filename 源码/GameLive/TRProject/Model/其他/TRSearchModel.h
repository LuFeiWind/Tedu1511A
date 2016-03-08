//
//  TRSearchModel.h
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseModel.h"

@class TRSearchDataModel, TRSearchDataItemsModel;
@interface TRSearchModel : TRBaseModel

@property (nonatomic, strong) TRSearchDataModel *data;
@property (nonatomic, assign) NSInteger code;

@end
@interface TRSearchDataModel : TRBaseModel

@property (nonatomic, assign) NSInteger play_status;

@property (nonatomic, assign) NSInteger pageNb;

@property (nonatomic, strong) NSArray<TRSearchDataItemsModel *> *items;

@property (nonatomic, assign) NSInteger total;

@end

@interface TRSearchDataItemsModel : TRBaseModel

@property (nonatomic, copy) NSString *category_slug;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *view;

@end

