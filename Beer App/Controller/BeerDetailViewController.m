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
    
    if (self.detailBeer == nil) {
        self.editingMode = ADDING_BEER;

    }
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    if (self.editingMode == EDITING_BEER) {
        self.nameTextField.text = self.detailBeer.name;
        NSUInteger grade = [self.detailBeer.alcoholGrade integerValue];
        [self.gradePicker selectRow:grade inComponent:0 animated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    if (self.editingMode == ADDING_BEER) {
        self.detailBeer = [[BeerInfo alloc] init];
    }
    
    
    self.detailBeer.name = self.nameTextField.text;

    if (self.editingMode == EDITING_BEER) {
        if ([self.delegate respondsToSelector:@selector(editBeerDidFinish:)]) {
            [self.delegate editBeerDidFinish:self.detailBeer];
        }
    }
    if (self.editingMode == ADDING_BEER) {
        if ([self.delegate respondsToSelector:@selector(addBeerDidiFinish:)]) {
            [self.delegate addBeerDidiFinish:self.detailBeer];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)cancelButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark Picker View Delegate Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 101;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    NSString *s = [NSString stringWithFormat:@"🍺 %lu º", row];
    
    return s;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.detailBeer.alcoholGrade = [NSNumber numberWithInteger:row];

}


@end

