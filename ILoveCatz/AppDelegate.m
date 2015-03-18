//
//  AppDelegate.m
//  ILoveCatz
//
//  Created by Nate on 17/03/2015.
//  Copyright (c) 2015 Nathan CHEN. All rights reserved.
//

#import "AppDelegate.h"
#import "Cat.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (NSMutableArray *)cats
{
    _cats = [[NSMutableArray alloc] initWithObjects:
             [[Cat alloc] initWithImage:@"CatInBin.jpg" title:@"Cat in a bin" attribution:@"http://www.sxc.hu/photo/1406907"],
             [[Cat alloc] initWithImage:@"DancingCat.jpg" title:@"Dancing cat" attribution:@"http://www.sxc.hu/photo/1378836"],
             [[Cat alloc] initWithImage:@"KittensInABasket.jpg" title:@"Kittens in a basket" attribution:@"http://www.sxc.hu/photo/1178601"],
             [[Cat alloc] initWithImage:@"RelaxedCat.jpg" title:@"Relaxed cat" attribution:@"http://www.sxc.hu/photo/1361582"],
             [[Cat alloc] initWithImage:@"VeryYoungKitten.jpg" title:@"Very young cat" attribution:@"http://www.sxc.hu/photo/235473"],
             [[Cat alloc] initWithImage:@"YawningCat.jpg" title:@"Yawning cat" attribution:@"http://www.sxc.hu/photo/1353556"],
             [[Cat alloc] initWithImage:@"CuteKitten.jpg" title:@"Cute kitten" attribution:@"http://www.sxc.hu/photo/1319510"],nil];
    return _cats;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIColor *navColor = [UIColor colorWithRed:0.97 green:0.37 blue:0.38 alpha:1.0];
    [UINavigationBar appearance].barTintColor = navColor;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].titleTextAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:NSForegroundColorAttributeName, [UIColor whiteColor], nil];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

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
