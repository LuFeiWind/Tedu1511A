//
//  TRLiveNetManager.h
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRRoomListModel.h"
@interface TRLiveNetManager : NSObject


/** 获取游戏房间列表 */
+ (id)getRoomListCompletionHandler:kCompetionHandlerBlock

@end
