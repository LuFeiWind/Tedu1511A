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

@end
