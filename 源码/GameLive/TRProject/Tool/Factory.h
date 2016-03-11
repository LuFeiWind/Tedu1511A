//
//  Factory.h
//  TRProject
//
//  Created by jiyingxin on 16/2/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPlayerViewController.h"

@interface Factory : NSObject
+ (void)addBackItemToVC:(UIViewController *)vc;
+ (NSString *)md5:(NSString *)str;

+ (void)playVideo:(NSURL *)videoURL;

/** 右上角添加搜索按钮 */
+ (void)addSearchItemToVC:(UIViewController *)vc clickHandler:(void(^)())clickHandler;

+ (BOOL)isPhoneNumber:(NSString *)phoneNum;
@end
