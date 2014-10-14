//
//  Beer_AppTests.m
//  Beer AppTests
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BeerInfo.h"
#import "Beers.h"

@interface Beer_AppTests : XCTestCase

@end

@implementation Beer_AppTests

- (void)testIfBeerInitMethodNotNil {

    BeerInfo *newBeer = [[BeerInfo alloc] init];
    
    XCTAssertNotNil(newBeer);
    
}

- (void)testIfBeerInitMethodReturnsDefaultName {
    
    NSString *name = @"Unknown Beer";
    
    BeerInfo *newBeer = [[BeerInfo alloc] init];
    
    XCTAssertEqualObjects(name, newBeer.name);
    
}



- (void)testIfBeerWithNameInitNotNil {
    
    NSString *name = @"Duff";
    
    BeerInfo *newBeer = [[BeerInfo alloc] initWithName:name];
    
    XCTAssertNotNil(newBeer);
}

- (void)testIfAllBeersMethodReturnsSomething {
    
    Beers *b = [[Beers alloc] init];
    
    XCTAssertNotNil([b allBeers]);
    
}





@end
