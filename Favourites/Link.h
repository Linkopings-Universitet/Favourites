//
//  Link.h
//  Favourites
//
//  Copyright (c) 2012 Linköpings Universitet. All rights reserved.


#import <Foundation/Foundation.h>

@interface Link : NSObject

@property (nonatomic, copy) NSURL *url;

- (instancetype)initWithURL:(NSURL *)anURL;

@end
