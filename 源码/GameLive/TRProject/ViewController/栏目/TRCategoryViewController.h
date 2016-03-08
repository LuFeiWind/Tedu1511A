//
//  TRCategoryViewController.h
//  TRProject
//
//  Created by jiyingxin on 16/3/8.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewController.h"

@interface TRCategoryViewController : TRBaseViewController
- (instancetype)initWithSlug:(NSString *)slug categoryName:(NSString *)categoryName;
@property (nonatomic) NSString *slug;
@property (nonatomic) NSString *categoryName;
@end
