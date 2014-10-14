//
//  Beer.m
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import "Beers.h"


@implementation Beers

- (NSArray *)allBeers {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BeerList" ofType:@"plist"];
    
    NSArray *userList = [NSArray arrayWithContentsOfFile:filePath];
    
    self.arrayOfBeers = [[NSMutableArray alloc]init];
    
    for (NSDictionary *d in userList) {
        BeerInfo *b = [[BeerInfo alloc] init];
        
        b.name = [d valueForKey:@"name"];
        
        b.countryOrigin = [d valueForKey:@"country"];
        
        b.alcoholGrade = [d valueForKey:@"alcoholGrade"];
        
        b.photoUrl = [d valueForKey:@"photoUrl"];
        
        [self.arrayOfBeers addObject:b];
    }
    return self.arrayOfBeers;
}

- (void)addBeers:(BeerInfo *)beer {

    
}
@end
