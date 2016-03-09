//
//  TRIntroModel.h
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseModel.h"

@class TRIntroMobileLinkModel, TRIntroLinkModel,TRIntroMobileModel, TRIntroListModel;
@interface TRIntroModel : TRBaseModel
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *moblieWebgame;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *moblieMinecraft;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *mobileTvgame;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *moblieSport;
@property (nonatomic, strong) NSArray<TRIntroMobileModel *> *mobileStar;
@property (nonatomic, strong) NSArray<TRIntroMobileModel *> *mobileRecommendation;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *mobileLol;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *mobileHeartstone;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *moblieBlizzard;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *mobileBeauty;
@property (nonatomic, strong) NSArray<TRIntroMobileModel *> *mobileIndex;
@property (nonatomic, strong) NSArray<TRIntroListModel *> *list;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *mobileDota2;
@property (nonatomic, strong) NSArray<TRIntroMobileLinkModel *> *moblieDnf;

@end

@interface TRIntroMobileLinkModel : TRBaseModel
//link_objcet -> linkObject
@property (nonatomic, strong) TRIntroLinkModel *linkObject;

@end

@interface TRIntroLinkModel : TRBaseModel

@property (nonatomic, copy) NSString *defaultImage;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, assign) NSInteger weight;

@property (nonatomic, copy) NSString *lastPlayAt;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, assign) NSInteger charm;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *categorySlug;

@property (nonatomic, copy) NSString *lastEndAt;

@property (nonatomic, copy) NSString *lastThumb;

@property (nonatomic, assign) NSInteger check;

@property (nonatomic, copy) NSString *recommendImage;

@property (nonatomic, copy) NSString *appAhufflingImage;

@property (nonatomic, assign) NSInteger level;

@property (nonatomic, assign) NSString *uid;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, assign) NSInteger coin;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, assign) NSInteger view;

@property (nonatomic, copy) NSString *videoQuality;

@property (nonatomic, assign) NSInteger lockedView;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) NSInteger negativeView;

@property (nonatomic, assign) NSInteger follow;

@property (nonatomic, copy) NSString *firstPlayAt;

@end

@interface TRIntroMobileModel : TRBaseModel

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) NSInteger slotId;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *createAt;
@property (nonatomic, strong) TRIntroLinkModel *linkObject;
@property (nonatomic, copy) NSString *ext;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *fk;

@end

@interface TRIntroListModel : TRBaseModel

@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *name;

@end


