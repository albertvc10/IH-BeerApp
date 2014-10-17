//
//  Beer.h
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import <Foundation/Foundation.h>


//properties 
@interface BeerInfo : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *countryOrigin;

@property (nonatomic) NSNumber *alcoholGrade;

@property (nonatomic, strong) NSString *photoUrl;

//class methods
+ (BeerInfo *)beerWithName:(NSString *)name;
+ (BeerInfo *)beer;


//inits
- (instancetype)initWithName:(NSString *)name;

//other methods

@end
