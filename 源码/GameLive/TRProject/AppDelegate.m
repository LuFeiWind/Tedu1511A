//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+System.h"
#import "TRLiveNetManager.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    
    
    
    //    [TRLiveNetManager search:@"小智" page:0 completionHandler:^(id model, NSError *error) {
    //        
    //    }];
    
    //    [TRLiveNetManager getCategoryWithSlug:@"lol" completionHandler:^(id model, NSError *error) {
    //        
    //    }];
    
    //    [TRLiveNetManager getCategoriesCompletionHandler:^(id model, NSError *error) {
    //        
    //    }];
    
    //    [TRLiveNetManager getRoomWithUID:@"24076" completionHandler:^(id model, NSError *error) {
    //        
    //    }];
    
    //    [TRLiveNetManager getRoomListCompletionHandler:^(id model, NSError *error) {
    //        NSLog(@"房间列表测试通过");
    //    }];
    return YES;
}

@end
