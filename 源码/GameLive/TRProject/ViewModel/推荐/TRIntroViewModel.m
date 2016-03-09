//
//  TRIntroViewModel.m
//  TRProject
//
//  Created by jiyingxin on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRIntroViewModel.h"

@implementation TRIntroViewModel

- (NSInteger)indexNumber{
    return self.indexList.count;
}

- (TRIntroMobileModel *)indexModelForIndex:(NSInteger)index{
    return self.indexList[index];
}

- (NSURL *)indexIconURLForIndex:(NSInteger)index{
    return [NSURL URLWithString:[self indexModelForIndex:index].thumb];
}

- (NSString *)indexTitleForIndex:(NSInteger)index{
    return [self indexModelForIndex:index].title;
}

- (NSString *)indexUidForIndex:(NSInteger)index{
    return [self indexModelForIndex:index].linkObject.uid;
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TRLiveNetManager getIntroCompletionHandler:^(TRIntroModel *model, NSError *error) {
        if (!error) {
            self.indexList = model.mobileIndex;
        }
        completionHandler(error);
    }];
}

@end
