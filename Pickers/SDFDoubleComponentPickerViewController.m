//
//  SDFDoubleComponentPickerViewController.m
//  Pickers
//
//  Created by De Fano Salvatore on 09/06/15.
//  Copyright (c) 2015 Yoox. All rights reserved.
//

#import "SDFDoubleComponentPickerViewController.h"

@interface SDFDoubleComponentPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSArray *characterNames;
@property (strong, nonatomic) NSArray *characterAge;

@end

@implementation SDFDoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca",@"Artoo", @"Threepio", @"Lando"];
    self.characterAge = @[@"20", @"20", @"35", @"60",@"40", @"55", @"39"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger row = [self.doublePicker selectedRowInComponent:0];
    NSInteger row2 = [self.doublePicker selectedRowInComponent:1];
    NSString *selectedName = self.characterNames[row];
    NSString *selectedAge = self.characterAge[row2];
    NSString *title = [
                       [NSString alloc]
                       initWithFormat:@"You selected %@ is old %@!", selectedName, selectedAge
                       ];
    UIAlertView *alert = [
                          [UIAlertView alloc]
                          initWithTitle:title
                          message:@"Thank you for choosing."
                          delegate:nil
                          cancelButtonTitle:@"You're Welcome"
                          otherButtonTitles:nil
                          ];
    [alert show];
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.characterNames count];
    } else {
        return [self.characterAge count];
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (component == 0) {
        return self.characterNames[row];
    } else {
        return self.characterAge[row];
    }
}

@end
