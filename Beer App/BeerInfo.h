//
//  Beer.h
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeerInfo : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *countryOrigin;

@property (nonatomic, strong) NSNumber *alcoholGrade;

@property (nonatomic, strong) NSString *photoUrl;

- (instancetype)initWithName:(NSString *)name;



@end
