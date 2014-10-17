#import "BeersViewController.h"
#import "BeerInfo.h"
#import "Beers.h"
#import "BeerCell.h"


#define BEERS_SECTION 1

@interface BeersViewController ()

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
    
//    self.title = @"Beer List";
    
#warning REMEMBER TO CLEAN THIS CORPSE
    //Create and inject list of Beers in the VC
    
    Beers *b = [[Beers alloc]init];
    
    
    [self setArrayBeers:[b allBeers]];
    

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
    
    BeerCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"BeerCell"];
    
    
    BeerInfo *b = [self.arrayBeers objectAtIndex:indexPath.row];
    
        NSLog(@"name: %@", b.name);
    
    cell.beer = b;
    
    return cell;
    
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
////    NSString *name = [NSString stringWithFormat:@"Beer Name: %@", [[self.arrayBeers objectAtIndex:indexPath.row]name]];
////    
////    NSString *row = [NSString stringWithFormat:@"Row tapped: %lu", indexPath.row];
////    
////    UIAlertController *alert = [UIAlertController alertControllerWithTitle:name message:row preferredStyle:UIAlertControllerStyleActionSheet];
////    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
////        [alert dismissViewControllerAnimated:YES completion:nil];
////    }];
////    
////    [alert addAction:ok];
////    
////    [self presentViewController:alert animated:YES completion:nil];
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    BeerDetailViewController *vc = [[BeerDetailViewController alloc] init];
//    
//    BeerInfo *b = [self.arrayBeers  objectAtIndex:indexPath.row];
//    NSLog(@"%@", b);
//    
//    [vc setDetailBeer:b];
//    vc.delegate = self;
//    
//    [self.navigationController pushViewController:vc animated:YES];
//}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"AddBeerSegue"]) {
        BeerDetailViewController *vc = (BeerDetailViewController *)[segue destinationViewController];
        
        vc.delegate = self;
    }
    if ([[segue identifier] isEqualToString:@"editBeerSegue"]) {
        BeerDetailViewController *vc2 = (BeerDetailViewController *)[segue destinationViewController];
        
        BeerInfo *b = [self.arrayBeers objectAtIndex:[self.tableView indexPathForSelectedRow].row];

        vc2.detailBeer = b;
    }
    
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
