//
//  Beer.m
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import "BeerInfo.h"

@implementation BeerInfo

+ (BeerInfo *)beerWithName:(NSString *)name {
    
    BeerInfo *b = [[BeerInfo alloc] initWithName:name];
    
    return b;
}

+ (BeerInfo *)beer {
    
    return [self beerWithName:@"jdhsd"];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"Unknown Beer";
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}


- (instancetype)initWithName:(NSString *)name countryOrigin:(NSString *)country alcoholGrade:(NSNumber *)grade andPhotoUrl:(NSString *)url
{
    self = [self initWithName:name];
    if (self) {
        
        _name = name;
        _countryOrigin = country;
        _alcoholGrade = grade;
        _photoUrl = url;
        
    }
    return self;
}

@end
