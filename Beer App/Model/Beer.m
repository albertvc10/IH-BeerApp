//
//  Beer.m
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import "Beer.h"
#import "BeerInfo.h"

@implementation Beer

- (NSArray *)allBeers {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BeerList" ofType:@"plist"];
    
    NSArray *userList = [NSArray arrayWithContentsOfFile:filePath];
    
    self.arrayBeers = [[NSMutableArray alloc]init];
    
    for (NSDictionary *d in userList) {
        BeerInfo *b = [[BeerInfo alloc] init];
        
        b.name = [d valueForKey:@"name"];
        
        b.countryOrigin = [d valueForKey:@"country"];
        
        b.alcoholGrade = [d valueForKey:@"alcoholGrade"];
        
        b.photoUrl = [d valueForKey:@"photoUrl"];
        
        [self.arrayBeers addObject:b];
    }
    return self.arrayBeers;
}

@end
