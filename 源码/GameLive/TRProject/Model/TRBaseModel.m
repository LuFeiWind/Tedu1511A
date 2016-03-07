//
//  TRBaseModel.m
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseModel.h"

@implementation TRBaseModel
MJCodingImplementation

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_underlineFromCamel];
}

+ (NSDictionary *)replaceKeyFromPropertyName{
    return @{@"ID": @"id",
             @"desc": @"description"};
}
@end
