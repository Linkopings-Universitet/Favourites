//
//  AppDelegate.m
//  Favourites
//
//  Created by Cenny Davidsson on 2014-10-03.
//  Copyright (c) 2014 Linköpings University. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import "MasterViewController.h"
#import "Link.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Förbered splitviewcontrollern
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *detailNavigationController = [splitViewController.viewControllers lastObject];
    detailNavigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    
    // Ladda in våra default links i masterViewControllern
    UINavigationController *masterNavigationController = splitViewController.viewControllers.firstObject;
    MasterViewController *masterViewController = (MasterViewController *)masterNavigationController.topViewController;
    masterViewController.links = [self defaultLinks].mutableCopy;
    
    return YES;
}

- (NSArray *)defaultLinks {
    Link *firstLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://lisam.liu.se"]];
    
    Link *secondLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://www.ida.liu.se/~725G60/index.sv.shtml"]];
    
    Link *thirdLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://developer.apple.com"]];
    
    Link *fourthLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=UF8uR6Z6KLc"]];
    
    return @[firstLink, secondLink, thirdLink, fourthLink];
}


#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] link] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
