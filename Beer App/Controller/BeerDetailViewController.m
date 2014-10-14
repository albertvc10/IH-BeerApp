//
//  BeerDetailViewController.m
//  Beer App
//
//  Created by Albert Villanueva Carreras on 14/10/14.
//  Copyright (c) 2014 Albert Villanueva Carreras. All rights reserved.
//

#import "BeerDetailViewController.h"

typedef enum {
    ADDING_BEER = 0,
    EDITING_BEER = 1
} EditingMode;

@interface BeerDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UIPickerView *gradePicker;

@property (nonatomic) EditingMode editingMode;

@end

@implementation BeerDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.editingMode = EDITING_BEER;
    
    
    self.title = @"Detail";
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                                                                     UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
                                                                     UITextAttributeTextShadowColor, 
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], 
                                                                     UITextAttributeTextShadowOffset, 
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0],
                                                                     UITextAttributeFont, 
                                                                     nil]];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if (self.detailBeer) {
        self.editingMode = ADDING_BEER;
    }
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    if (self.editingMode == EDITING_BEER) {
        self.nameTextField.text = self.detailBeer.name;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    self.detailBeer.name = self.nameTextField.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)cancelButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
