//
//  MasterViewController.m
//  Favourites
//
//  Created by Alek Åström on 2012-02-12.
//  Edited by Cenny Davidsson 2014-01-15.
//  Copyright (c) 2012 Linköpings Universitet. All rights reserved.
//

/**
 Denna vykontroller styr en tabell som visar länkar.
 När en användare trycker på en länk pushas DetailViewController in på iPhone,
 medan på iPad så uppdateras bara DetailViewController med en ny länk.
 Observera även att prepareForSegue körs för att skicka länken till den pushade
 vykontrollern på iPhone.
 
 Det du behöver göra i denna vykontroller är tre saker:
 
 1: Användaren ska kunna ta bort länkar med swipe-to-delete och genom att gå in
 i editing mode.
 
 2: Cellerna inte bara visa URLen på länken men även en titel. För att göra det
 behöver ni ändra stil på tabellvycellen som visas. Ni får göra en egen cell,
 men ni kan även använda någon av de andra inbyggda cellstilarna. Se även till att
 uppdatera modellen (Link) så att den har en property för en titel.
 
 3: Användaren ska kunna lägga in nya länkar med en modal vykontroller. Vy-kontrollern
 ska innehålla ett formulär för att skriva in en URL och en titel på länken. Ni kommer
 vara tvugna att skriva ett eget delegatprotokoll för att skicka data tillbaka till denna
 vykontroller när användaren fyllt i formuläret. På iPad är det lämpligt att använda sig
 av stilen UIModalPresentationFormSheet för att presentera vykontrollern.
 */

#import "MasterViewController.h"
#import "DetailViewController.h"

#define IS_IPAD() UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

@implementation MasterViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (IS_IPAD()) {
        // Hämta detaljvyn från SplitViewControllern
        self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
        // Markera första cellen och sätt första länken till detaljvyn
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        self.detailViewController.link = self.links[0];
        
        // När man öppnar/stänger popovern ska tabellen ej avmarkera celler
        self.clearsSelectionOnViewWillAppear = NO;
    }
    
    // Avkommentera följande för att enkelt få en edit-knapp
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"linkPush"]) {
        // Skicka länken till detaljvyn
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.link = self.links[self.tableView.indexPathForSelectedRow.row];
    }
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.links.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Hämta cell
    static NSString *reuseIdentifier = @"LinkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    // Hämta data
    Link *link = self.links[indexPath.row];
    
    // Konfigurera cellen
    cell.textLabel.text = link.url.description;
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!IS_IPAD()) {
        // Om iPhone, pusha in detaljkontrollern
        [self performSegueWithIdentifier:@"linkPush" sender:self];
    } else {
        // Om iPad, sätt data i detaljkontrollern
        self.detailViewController.link = self.links[indexPath.row];
    }
}

@end
