//
//  DetailViewController.h
//  Favourites
//
//  Created by Cenny Davidsson on 2014-10-03.
//  Copyright (c) 2014 Linköpings University. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Link;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Link *link;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

