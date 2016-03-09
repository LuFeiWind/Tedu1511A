//
//  TRSearchViewModel.h
//  TRProject
//
//  Created by jiyingxin on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "TRLiveNetManager.h"

@interface TRSearchViewModel : TRBaseViewModel
@property (nonatomic) NSString *words;
@property (nonatomic) NSArray<TRSearchDataItemsModel *> *items;


@end
