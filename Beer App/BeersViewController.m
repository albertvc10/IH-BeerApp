//
//  BeersViewController.m
//  Beer App
//
//  Created by Albert Villanueva Carreras on 13/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import "BeersViewController.h"
#import "BeerInfo.h"
#import "Beers.h"


#define BEERS_SECTION 1

@interface BeersViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BeersViewController


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Beer List";
    
    [self addBeerButtonToNavigationBar];
    

}

- (void)addBeerButtonToNavigationBar {
    
    UIBarButtonItem *b = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addNewBeerButtonPressed)];
    [self.navigationItem setRightBarButtonItem:b];
    

}

- (void)addNewBeerButtonPressed {
    
    BeerDetailViewController *vc = [[BeerDetailViewController alloc] init];
    
    vc.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return BEERS_SECTION;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.arrayBeers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myCell"];
    }
    
    UIImage *image;
    NSData *data;
    NSURL *url;
    
    BeerInfo *b = [self.arrayBeers objectAtIndex:indexPath.row];
    

       
        NSLog(@"name: %@", b.name);
        
        cell.textLabel.text = b.name;
        cell.detailTextLabel.text = b.countryOrigin;
        url = [NSURL URLWithString:b.photoUrl];
        data = [NSData dataWithContentsOfURL:url];
        image = [[UIImage alloc] initWithData:data];
        cell.imageView.image = image;

    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSString *name = [NSString stringWithFormat:@"Beer Name: %@", [[self.arrayBeers objectAtIndex:indexPath.row]name]];
//    
//    NSString *row = [NSString stringWithFormat:@"Row tapped: %lu", indexPath.row];
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:name message:row preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        [alert dismissViewControllerAnimated:YES completion:nil];
//    }];
//    
//    [alert addAction:ok];
//    
//    [self presentViewController:alert animated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BeerDetailViewController *vc = [[BeerDetailViewController alloc] init];
    
    BeerInfo *b = [self.arrayBeers  objectAtIndex:indexPath.row];
    NSLog(@"%@", b);
    
    [vc setDetailBeer:b];
    vc.delegate = self;
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark Edit Beer Delegate methods

- (void)editBeerDidFinish:(BeerInfo *)beer {
    
#warning fix side effect and do it right
    [self.tableView reloadData];
}

- (void)addBeerDidiFinish:(BeerInfo *)beer {
    
    [self.arrayBeers addObject:beer];
    [self.tableView reloadData];
}


@end
