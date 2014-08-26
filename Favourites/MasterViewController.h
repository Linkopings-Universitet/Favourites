//
//  MasterViewController.h
//  Favourites
//
//  Created by Alek Åström on 2012-02-12.
//  Edited by Cenny Davidsson 2014-01-15.
//  Copyright (c) 2012 Linköpings Universitet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController; // Används på iPad med SplitViewControllern
@property (strong, nonatomic) NSMutableArray *links; // Denna vykontrollers modell, består av Link-objekt

@end