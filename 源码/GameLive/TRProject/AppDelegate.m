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
#import "TRChatViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "TRFriend.h"

@interface AppDelegate ()<EMClientDelegate, EMContactManagerDelegate>
@end

@implementation AppDelegate

#pragma mark - Life Circle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    self.window.rootViewController = self.tabC;
    //    [[EaseSDKHelper shareHelper] easemobApplication:application
    //                      didFinishLaunchingWithOptions:launchOptions
    //                                             appkey:kEaseMobKey
    //                                       apnsCertName:nil
    //                                        otherConfig:@{kSDKConfigEnableConsoleLogger:@NO}];
    
    EMOptions *options = [EMOptions optionsWithAppkey:kEaseMobKey];
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    [[EMClient sharedClient] addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    //初始化应用，appKey和appSecret从后台申请得
    [SMSSDK registerApp:kShareSDKAppKey
             withSecret:kShareSDKAppSecret];
    
    [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
    return YES;
}

/*!
 *  用户A发送加用户B为好友的申请，用户B会收到这个回调
 *
 *  @param aUsername   用户名
 *  @param aMessage    附属信息
 */
- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername
                                       message:(NSString *)aMessage{
    TRFriend *friend = [TRFriend new];
    friend.userName = aUsername;
    friend.message = aMessage;
    [friend saveUser];
    
    NSLog(@"didReceiveFriendInvitationFromUsername %@", aUsername);
}

/*!
 @method
 @brief 用户A发送加用户B为好友的申请，用户B同意后，用户A会收到这个回调
 */
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername{
    [self.window showWarning:[aUsername stringByAppendingString:@"已同意您的好友请求!"]];
}

/*!
 @method
 @brief 用户A发送加用户B为好友的申请，用户B拒绝后，用户A会收到这个回调
 */
- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername{
    [self.window showWarning:[aUsername stringByAppendingString:@"已拒绝您的好友请求!"]];
}


#pragma mark - EaseMob delegate
- (void)didAutoLoginWithError:(EMError *)aError{
    DDLogVerbose(@"didAutoLoginWithError %@", aError);
}

/*!
 *  当前登录账号在其它设备登录时会接收到该回调
 */
- (void)didLoginFromOtherDevice{
    DDLogVerbose(@"didLoginFromOtherDevice");
}

/*!
 *  当前登录账号已经被从服务器端删除时会收到该回调
 */
- (void)didRemovedFromServer{
    DDLogVerbose(@"didLoginFromOtherDevice");
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
        TRChatViewController *chatVC = [[TRChatViewController alloc] initWithStyle:UITableViewStyleGrouped];
        UINavigationController *chatNavi = [[UINavigationController alloc] initWithRootViewController:chatVC];
        _tabC.viewControllers = @[introNavi, categoriesNavi, liveListNavi, chatNavi];
    }
    return _tabC;
}

@end
