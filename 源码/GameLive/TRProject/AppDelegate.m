//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+System.h"
#import "TRCategoriesViewController.h"
#import "TRLiveListViewController.h"
#import "TRIntroViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

#pragma mark - Life Circle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    self.window.rootViewController = self.tabC;
    return YES;
}


#pragma mark - Lazy Load

- (UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (UITabBarController *)tabC{
    if (!_tabC) {
        _tabC = [[UITabBarController alloc] init];
        TRIntroViewController *introVC = [TRIntroViewController new];
        TRCategoriesViewController *categoriesVC = [TRCategoriesViewController new];
        TRLiveListViewController *liveListVC = [TRLiveListViewController new];
        UINavigationController *introNavi = [[UINavigationController alloc] initWithRootViewController:introVC];
        UINavigationController *categoriesNavi = [[UINavigationController alloc] initWithRootViewController:categoriesVC];
        UINavigationController *liveListNavi = [[UINavigationController alloc] initWithRootViewController:liveListVC];
        _tabC.viewControllers = @[introNavi, categoriesNavi, liveListNavi];
    }
    return _tabC;
}

@end
