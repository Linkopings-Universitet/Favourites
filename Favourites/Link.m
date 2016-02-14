//
//  Link.m
//  Favourites
//
//  Copyright (c) 2012 Linköpings Universitet. All rights reserved.


#import "Link.h"

/**
 Detta är ett ytterst enkelt modellobjekt som innehåller en property: en URL.
 Ni ska utöka modellen så att den även kan lagra en titel för varje länk.
 */

@implementation Link

- (instancetype)initWithURL:(NSURL *)anURL {
    self = [super init];
    
    if (self) {
        _url = anURL;
    }
    
    return self;
}

@end
