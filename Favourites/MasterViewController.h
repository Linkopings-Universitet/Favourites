//
//  MasterViewController.h
//  Favourites
//
//  Created by Cenny Davidsson on 2014-10-03.
//  Copyright (c) 2014 Linköpings University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSMutableArray *links; // Denna vykontrollers modell, består av Link-objekt


@end

