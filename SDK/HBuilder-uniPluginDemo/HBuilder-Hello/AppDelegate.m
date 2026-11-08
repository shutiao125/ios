//
//  AppDelegate.m
//  Pandora
//
//  Created by Mac Pro_C on 12-12-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "PDRCore.h"
#import "PDRCommonString.h"
#import "ViewController.h"
#import "PDRCoreApp.h"
#import "PDRCoreAppManager.h"


@interface AppDelegate()<PDRCoreDelegate>
@property (strong, nonatomic) ViewController *h5ViewContoller;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize rootViewController;
#pragma mark -
#pragma mark app lifecycle
/*
 * @Summary:程序启动时收到push消息
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return [PDRCore initEngineWihtOptions:launchOptions
                              withRunMode:PDRCoreRunModeNormal withDelegate:self];
}

- (void)configureWindow:(UIWindow *)window
{
    self.window = window;
    
    ViewController *viewController = [[ViewController alloc] init];
    self.h5ViewContoller = viewController;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.rootViewController = navigationController;
    navigationController.navigationBarHidden = YES;
    {
        [self startMainApp];
        self.h5ViewContoller.showLoadingView = YES;
    }
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
}

-(BOOL)getStatusBarHidden {
    return [self.h5ViewContoller getStatusBarHidden];
}

-(UIStatusBarStyle)getStatusBarStyle {
    return [self.h5ViewContoller getStatusBarStyle];
}
-(void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    [self.h5ViewContoller setStatusBarStyle:statusBarStyle];
}

-(void)wantsFullScreen:(BOOL)fullScreen
{
    [self.h5ViewContoller wantsFullScreen:fullScreen];
}

#pragma mark -
- (void)startMainApp {
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [[PDRCore Instance] start];
    });
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
  completionHandler:(void(^)(BOOL succeeded))completionHandler{
    [PDRCore handleSysEvent:PDRCoreSysEventPeekQuickAction withObject:shortcutItem];
    completionHandler(true);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [PDRCore destoryEngine];
}

#pragma mark -
#pragma mark URL

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    [self application:application handleOpenURL:url];
    return YES;
}

/*
 * @Summary:程序被第三方调用，传入参数启动
 *
 */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [PDRCore handleSysEvent:PDRCoreSysEventOpenURL withObject:url];
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    [PDRCore handleSysEvent:PDRCoreSysEventOpenURLWithOptions withObject:@[url,options]];
    return YES;
}
/*
 * @Summary:远程push注册成功收到DeviceToken回调
 *
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"application--didRegisterForRemoteNotificationsWithDeviceToken[%@]", deviceToken);
    [PDRCore handleSysEvent:PDRCoreSysEventRevDeviceToken withObject:deviceToken];
}

/*
 * @Summary: 远程push注册失败
 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [PDRCore handleSysEvent:PDRCoreSysEventRegRemoteNotificationsError withObject:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PDRCore handleSysEvent:PDRCoreSysEventRevRemoteNotification withObject:userInfo];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [self application:application didReceiveRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}


/*
 * @Summary:程序收到本地消息
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [PDRCore handleSysEvent:PDRCoreSysEventRevLocalNotification withObject:notification];
}

@end

@implementation UINavigationController(Orient)

-(BOOL)shouldAutorotate{
    return ![PDRCore Instance].lockScreen;
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if([self.topViewController isKindOfClass:[ViewController class]])
        return [self.topViewController supportedInterfaceOrientations];
    return UIInterfaceOrientationMaskPortrait;
}
@end
