//
//  DetailViewController.m
//  Favourites
//
//  Created by Cenny Davidsson on 2014-10-03.
//  Copyright (c) 2014 Linköpings University. All rights reserved.
//

/*
 Denna vykontroller visar upp en länk i en WebView som täcker hela vykontrollerns storlek.
 Observera att vykontrollern förlitar sig på att ha fått en länk att visa med sin link-property.
 
 Det ni behöver göra i denna kontroller är att uppdatera den så att den även visar en titel i sin navigation bar
 för länken och inte URLen som det är nu.
 */

#import "DetailViewController.h"
#import "Link.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

// Egen setter för link som uppdaterar gränsnittet så fort länken ändras
- (void)setLink:(Link *)newLink {
    // Om länken är ny, sätt den
    if (self.link != newLink) {
        _link = newLink;
        
        // Uppdatera vyn
        [self configureView];
    }
}

- (void)configureView {
    // Uppdaterar användargränsnittet för att visa en länk
    if (self.link) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.link.url]];
        self.title = self.link.url.description;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


@end
