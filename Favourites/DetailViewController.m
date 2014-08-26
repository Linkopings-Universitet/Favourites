//
//  DetailViewController.m
//  Favourites
//
//  Created by Alek Åström on 2012-02-12.
//  Edited by Cenny Davidsson 2014-01-15.
//  Copyright (c) 2012 Linköpings Universitet. All rights reserved.
//

/**
 Denna vykontroller visar upp en länk i en WebView som täcker hela vykontrollerns storlek.
 Observera att vykontrollern förlitar sig på att ha fått en länk att visa med sin link-property.

 Det ni behöver göra i denna kontroller är att uppdatera den så att den även visar en titel i sin navigation bar
 för länken och inte URLen som det är nu.
 */

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DetailViewController

#define IS_IPAD() UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

#pragma mark - Managing the detail item

// Egen setter för link som uppdaterar gränsnittet så fort länken ändras
- (void)setLink:(Link *)newLink
{
    // Om länken är ny, sätt den
    if (self.link != newLink) {
        _link = newLink;
        
        // Uppdatera vyn
        [self configureView];
    }

    // Om mastervyn ligger i en popover så stäng den (observera att vi kan skicka meddelanden till nil-objekt)
    [self.masterPopoverController dismissPopoverAnimated:YES];      
}

// Uppdaterar användargränsnitt för att visa en länk

- (void)configureView
{
    // Uppdaterar användargränsnittet för att visa en länk
    if (self.link) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.link.url]];
        self.title = [NSString stringWithFormat:@"%@", self.link.url];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Konfigurera vyn för vår data
    [self configureView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Upp och ner ej tillåtet på iPhone
    if (!IS_IPAD()) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController {
    // När användaren roterar till stående läge på iPad, sätt titel på knapp
    barButtonItem.title = NSLocalizedString(@"Länkar", @"Länkar");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
