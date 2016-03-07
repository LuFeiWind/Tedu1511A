//
//  TRRoomListModel.h
//  TRProject
//  游戏房间列表,对应直播分页
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseModel.h"

@class TRRoomListRecommendModel,TRRoomListRecommendDataLinkObjectModel,TRRoomListRecommendDataModel,TRRoomListDataModel;
@interface TRRoomListModel : TRBaseModel

@property (nonatomic, strong) TRRoomListRecommendModel *recommend;

@property (nonatomic, strong) NSArray<TRRoomListDataModel *> *data;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, copy) NSString *icon;

@end
@interface TRRoomListRecommendModel : TRBaseModel

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong) NSArray<TRRoomListRecommendDataModel *> *data;

@end

@interface TRRoomListRecommendDataModel : TRBaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, assign) NSInteger slotId;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, strong) TRRoomListRecommendDataLinkObjectModel *linkObject;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

@interface TRRoomListRecommendDataLinkObjectModel : TRBaseModel

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weightAdd;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *followAdd;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *playAount;

@property (nonatomic, copy) NSString *negativeView;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coinAdd;

@property (nonatomic, copy) NSString *defaultImage;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommendImage;

@property (nonatomic, copy) NSString *lockedView;

@property (nonatomic, copy) NSString *lastEndAt;

@property (nonatomic, copy) NSString *videoQuality;

@property (nonatomic, copy) NSString *firstPlayAt;

@property (nonatomic, copy) NSString *follow;

@property (nonatomic, copy) NSString *followBak;

@property (nonatomic, copy) NSString *playAt;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *appShufflingImage;

@property (nonatomic, copy) NSString *categoryId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *categorySlug;

@end

@interface TRRoomListDataModel : TRBaseModel

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weightAdd;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *followAdd;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *playCount;

@property (nonatomic, copy) NSString *negativeView;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coinAdd;

@property (nonatomic, copy) NSString *defaultImage;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommendImage;

@property (nonatomic, copy) NSString *lockedView;

@property (nonatomic, copy) NSString *lastEndAt;

@property (nonatomic, copy) NSString *videoQuality;

@property (nonatomic, copy) NSString *firstPlayAt;

@property (nonatomic, assign) NSInteger follow;

@property (nonatomic, copy) NSString *followBak;

@property (nonatomic, copy) NSString *playAt;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *appShufflingImage;

@property (nonatomic, copy) NSString *categoryId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *categorySlug;

@end

