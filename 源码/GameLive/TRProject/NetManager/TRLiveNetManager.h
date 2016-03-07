//
//  TRLiveNetManager.h
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRRoomListModel.h"
#import "TRRoomModel.h"
@interface TRLiveNetManager : NSObject


/** 获取游戏房间列表 */
+ (id)getRoomListCompletionHandler:kCompetionHandlerBlock

/**
 *  获取游戏房间的详细信息
 *
 *  @param uid 房间的唯一标识
 *
 *  @return 网络请求任务
 */
+ (id)getRoomWithUID:(NSString *)uid completionHandler:kCompetionHandlerBlock
@end
