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

- (NSURL *)indexURLForIndex:(NSInteger)index{
    NSString *uid = [self indexModelForIndex:index].linkObject.uid;
    return [NSURL URLWithString:[NSString stringWithFormat:kVideoPath, uid]];
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TRLiveNetManager getIntroCompletionHandler:^(TRIntroModel *model, NSError *error) {
        if (!error) {
            self.indexList = model.mobileIndex;
            self.starList = model.mobileStar;
        }
        completionHandler(error);
    }];
}


- (NSInteger)starNumber{
    return self.starList.count;
}
- (TRIntroMobileModel *)starModelForIndex:(NSInteger)index{
    return self.starList[index];
}
- (NSString *)starNameForIndex:(NSInteger)index{
    return [self starModelForIndex:index].title;
}
- (NSURL *)starIconURLForIndex:(NSInteger)index{
    return [NSURL URLWithString:[self starModelForIndex:index].thumb];
}
- (NSURL *)starVideoURLForIndex:(NSInteger)index{
    NSString *uid = [self starModelForIndex:index].linkObject.uid;
    return [NSURL URLWithString:[NSString stringWithFormat:kVideoPath, uid]];
}






@end
