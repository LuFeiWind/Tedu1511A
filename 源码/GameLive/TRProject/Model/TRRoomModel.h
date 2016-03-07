//
//  TRRoomModel.h
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseModel.h"

@class TRRoomLiveModel, TRRoomLiveWsModel, TRRoomLiveWsHlsThreeModel, TRRoomRankTotalModel, TRRoomCrossModel, TRRoomAdminsModel,TRRoomLiveWsHlsModel;
@interface TRRoomModel : TRBaseModel

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *lastPlayAt;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL playStatus;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, strong) TRRoomLiveModel *live;

@property (nonatomic, assign) BOOL forbidStatus;

@property (nonatomic, strong) NSArray *hotWord;

@property (nonatomic, strong) NSArray<TRRoomAdminsModel *> *admins;

@property (nonatomic, strong) NSArray<TRRoomCrossModel *> *cross;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, strong) NSArray<TRRoomRankTotalModel *> *rankWeek;

@property (nonatomic, assign) BOOL isStar;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, strong) NSArray *notice;

@property (nonatomic, strong) NSArray<TRRoomRankTotalModel *> *rankTotal;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *videoQuality;

@property (nonatomic, copy) NSString *categoryId;

@property (nonatomic, assign) NSInteger follow;

@end
@interface TRRoomLiveModel : TRBaseModel

@property (nonatomic, strong) TRRoomLiveWsModel *ws;

@end

@interface TRRoomLiveWsModel : TRBaseModel

@property (nonatomic, copy) NSString *defMobile;

@property (nonatomic, strong) TRRoomLiveWsHlsModel *rtmp;

@property (nonatomic, copy) NSString *defPc;

@property (nonatomic, strong) TRRoomLiveWsHlsModel *hls;

@property (nonatomic, strong) TRRoomLiveWsHlsModel *flv;

@end

@interface TRRoomLiveWsHlsModel : TRBaseModel

@property (nonatomic, strong) TRRoomLiveWsHlsThreeModel *three;

@property (nonatomic, strong) TRRoomLiveWsHlsThreeModel *four;

@property (nonatomic, assign) NSInteger mainPc;

@property (nonatomic, assign) NSInteger mainMobile;

@end

@interface TRRoomLiveWsHlsThreeModel : TRBaseModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *src;
@end

@interface TRRoomRankTotalModel : TRBaseModel

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, copy) NSString *rank;

@property (nonatomic, copy) NSString *sendUid;

@property (nonatomic, copy) NSString *sendNick;

@end

@interface TRRoomCrossModel : TRBaseModel

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *weightAdd;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *followAdd;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *playCount;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *negativeView;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;

@property (nonatomic, copy) NSString *coinAdd;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, copy) NSString *defaultImage;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *recommendImage;

@property (nonatomic, copy) NSString *lockedView;

@property (nonatomic, copy) NSString *lastEndAt;

@property (nonatomic, copy) NSString *videoQuality;

@property (nonatomic, copy) NSString *firstPlayAt;

@property (nonatomic, copy) NSString *follow;

@property (nonatomic, copy) NSString *followBak;

@property (nonatomic, copy) NSString *appShufflingImage;

@property (nonatomic, copy) NSString *categoryId;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *playAt;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *categorySlug;

@end

@interface TRRoomAdminsModel : TRBaseModel

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *nick;

@end

