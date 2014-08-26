//
//  Link.m
//  Favourites
//
//  Created by Alek Åström on 2012-02-12.
//  Edited by Cenny Davidsson 2014-01-15.
//  Copyright (c) 2012 Linköpings Universitet. All rights reserved.
//

#import "Link.h"

/**
 Detta är ett ytterst enkelt modellobjekt som innehåller en property: en URL.
 Ni ska utöka modellen så att den även kan lagra en titel för varje länk.
 */

@implementation Link

- (id)initWithURL:(NSURL *)anURL {
    self = [super init];
    
    if (self) {
        self.url = anURL;
    }
    
    return self;
}

@end
