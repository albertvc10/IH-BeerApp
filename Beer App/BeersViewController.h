//
//  BeersViewController.h
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BeerDetailViewController.h"

@interface BeersViewController : UITableViewController <EditBeerDelegate>


@property (nonatomic, strong) NSMutableArray *arrayBeers;

@end
