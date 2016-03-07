//
//  TRLiveNetManager.m
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRLiveNetManager.h"

@implementation TRLiveNetManager

+ (id)getRoomListCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kRoomsPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([TRRoomListModel parse:responseObj], error);
    }];
}

+ (id)getRoomWithUID:(NSString *)uid completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kRoomDetailPath, uid];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([TRRoomModel parse:responseObj], error);
    }];
}

+(id)getCategoriesCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kCategoriesPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([TRCategoriesModel parse:responseObj], error);
    }];
}

+ (id)getCategoryWithSlug:(NSString *)slug completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kCategoryRoomsPath, slug];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([TRCategoryModel parse:responseObj], error);
    }];
}

+ (id)search:(NSString *)words page:(NSInteger)page completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"site.search" forKey:@"m"];
    [params setObject:@"2" forKey:@"os"];
    [params setObject:@"0" forKey:@"p[categoryId]"];
    [params setObject:words forKey:@"p[key]"];
    [params setObject:@(page) forKey:@"p[page]"];
    [params setObject:@"10" forKey:@"p[size]"];
    [params setObject:@"1.3.2" forKey:@"v"];
    
    return [self POST:kSearchPath parameters:params progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([TRSearchModel parse:responseObj], error);
    }];
}

@end












