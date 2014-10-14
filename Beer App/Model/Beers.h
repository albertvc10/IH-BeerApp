//
//  Beer.h
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeerInfo.h"

@interface Beers : NSObject

@property (nonatomic, strong) NSMutableArray *arrayOfBeers;

- (NSArray *)allBeers;

- (void)addBeers:(BeerInfo *)beer;

@end
