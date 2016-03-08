//
//  TRCategoriesViewModel.h
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRBaseViewModel.h"
#import "TRLiveNetManager.h"
#import "NSObject+ViewModel.h"
@interface TRCategoriesViewModel : TRBaseViewModel
@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSArray *categories;

- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (TRCategoriesModel *)modelForRow:(NSInteger)row;
- (NSString *)slugForRow:(NSInteger)row;
@end
