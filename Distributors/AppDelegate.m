//
//  AppDelegate.m
//  Distributors
//
//  Created by Tao Yunfei on 7/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "RootTabController.h"
#import "AGUIDefine.h"
#import "NSObject+Singleton.h"
#import "AGNetworkDefine.h"
#import "DAStyleDefine.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


#pragma mark - user configs

- (void)configWindow{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
        RootTabController *rootTabC = [RootTabController singleton];
    //    [rootTabC setViewControllers:@[]];
    RootViewController *rootVC = [[RootViewController alloc] initWithRootViewController:rootTabC];
    
    [[self window] setRootViewController:rootVC];
    

    
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[self window] makeKeyAndVisible];
}

- (void)configAGUI{
//    [[AGUIDefine singleton] setLoginViewControllerClass:[AGLoginViewController class]];
    [[AGUIDefine singleton] setRootViewController:[RootViewController singleton]];
//    [[AGUIDefine singleton] setSessionRoleCodeBlock:^(void){
//        return [AGSession singleton].roleCode;
//    } ];
//    
//    [[AGUIDefine singleton] setSessionRoleIsRetailCustomerBlock:^(void){
//        return [AGSession singleton].loggedRole.isRetailCustomer;
//    } ];
    
//    [[AGUIDefine singleton] setAvailableLanguages:[AGConfigurationCoordinator singleton].availableLanguages];
}

- (void)configRemoter{
    
    //settting AGNetwork
//    [[AGNetworkDefine singleton] setDefaultProtocolVersion:[AGConfigurationCoordinator singleton].defaultProtocolVersion];
//    
//    //    TLOG(@"[DSHostSettingManager selectedServerUrl] -> %@", [DSHostSettingManager selectedServerUrl]);
//    
//    [[AGNetworkDefine singleton] setDefaultServerUrl:[DSHostSettingManager selectedServerUrl]
//     ];
//    
//    [[AGNetworkDefine singleton] setServerCurrentTimeReceivedBlock:^(NSString *serverCurrentTime) {
//        //        TLOG(@"serverCurrentTime -> %@", serverCurrentTime);
//        [[AGSession singleton] setServerCurrentTime:serverCurrentTime];
//    }];
//    
//    
//    [[AGNetworkDefine singleton] setClientID:[AGConfigurationCoordinator singleton].clientID];
//    [[AGNetworkConfig singleton] setClientSecret:[AGConfigurationCoordinator singleton].clientSecret];
//    //    [[AGNetworkConfig singleton] setIsOG:NO];
//    
//    [[AGNetworkDefine singleton] setErrorOccuredBlock:^(AGRemoterResult *result) {
//        NSString *requestType = [result.request requestType];
//        if (result.code == AGResultCodeInvalidAuthentication) {
//            if ([requestType isEqualToString:[DSRequestType authenticationToken]]) return;
//            TSNLOG(@"requestType -> %@", requestType);
//            [AGLogoutViewController present];
//        }else if(result.code == AGResultCodeInvalidAuthentication){
//            
//            if ([DSReachabilityManager singleton].isInternetReachable) {
//                if ([DSReachabilityManager singleton].isHostReachable) {
//                    [DSAlertUtil showGlobalPanelErrorOops];
//                    //                    TLOG(@"Oops");be
//                }else if (![DSReachabilityManager singleton].isHostReachable) {
//                    [DSAlertUtil showGobalPanelErrorCannotReachHost];
//                }
//            }
//            
//            if(![DSReachabilityManager singleton].isInternetReachable) {
//                [DSAlertUtil showGlobalPanelErrorConnectionError];
//            }
//        }
//        
//        
//        [DSAlertUtil dismissSVP];
//    }];
}

#pragma mark -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self configRemoter];
    [self configAGUI];
    [self configWindow];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
