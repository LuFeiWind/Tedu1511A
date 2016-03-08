//
//  TRCategoryViewModel.m
//  TRProject
//
//  Created by jiyingxin on 16/3/7.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRCategoryViewModel.h"

@implementation TRCategoryViewModel

- (id)initWithSlug:(NSString *)slug{
    if (self = [super init]) {
        self.slug = slug;
    }
    return self;
}

- (NSInteger)rowNumber{
    return self.roomList.count;
}

- (TRCategoryDataModel *)modelForRow:(NSInteger)row{
    return self.roomList[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}

- (NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].thumb];
}

- (NSString *)nickForRow:(NSInteger)row{
    return [self modelForRow:row].nick;
}

- (NSString *)viewForRow:(NSInteger)row{
    NSString *views = [self modelForRow:row].view;
    if (views.doubleValue >= 10000) {
        views = [NSString stringWithFormat:@"%.2f", views.doubleValue/10000.0];
    }
    return views;
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TRLiveNetManager getCategoryWithSlug:_slug completionHandler:^(TRCategoryModel *model, NSError *error) {
        if (!error) {
            self.page = model.page;
            self.size = model.size;
            self.total = model.total;
            self.pageCount = model.pageCount;
            if (model.page == 0) {
                [self.roomList removeAllObjects];
            }
            [self.roomList addObjectsFromArray:model.data];
        }
        completionHandler(error);
    }];
}

- (NSMutableArray *)roomList{
    if (!_roomList) {
        _roomList = [NSMutableArray new];
    }
    return _roomList;
}

@end
