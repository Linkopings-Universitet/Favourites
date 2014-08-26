//
//  AppDelegate.m
//  Favourites
//
//  Created by Alek Åström on 2012-02-12.
//  Modified by Jakob Bandelin on 2013-09-13
//  Copyright (c) 2012 Linköpings Universitet. All rights reserved.
//

#import "AppDelegate.h"
#import "Link.h"
#import "MasterViewController.h"

#define IS_IPAD() UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

/**
 Denna appdelegat förbereder split-vyn på iPad samt ger MasterViewController
 sin initiala data i form av fyra länkar. Det enda ni behöver göra i denna fil
 är att uppdatera länkarna med en titel när ni utökat modellen.
 */

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if (IS_IPAD()) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
        splitViewController.delegate = (id)navigationController.topViewController;
    }
    
    // Hämta MasterViewController så vi kan sätta dess initiala data
    MasterViewController *mvc;
    if (IS_IPAD()) {
        UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
        UINavigationController *navigationController = (splitViewController.viewControllers)[0];
        mvc = (MasterViewController *)navigationController.topViewController;
    } else {
        UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
        mvc = (MasterViewController *)navigationController.topViewController;
    }
    
    // Ge länkar till MasterViewController
    mvc.links = [NSMutableArray arrayWithArray:[self defaultLinks]];
    
    return YES;
}

- (NSArray *)defaultLinks {    
    Link *firstLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://lisam.liu.se"]];
    
    Link *secondLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://www.ida.liu.se/~725G60/index.sv.shtml"]];
    
    Link *thirdLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://developer.apple.com"]];
    
    Link *fourthLink = [[Link alloc] initWithURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=UF8uR6Z6KLc"]];
    
    return @[firstLink, secondLink, thirdLink, fourthLink];
}
@end
