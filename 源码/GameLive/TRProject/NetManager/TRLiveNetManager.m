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

@end
