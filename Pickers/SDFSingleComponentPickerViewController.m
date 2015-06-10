//
//  SDFSingleComponentPickerViewController.m
//  Pickers
//
//  Created by De Fano Salvatore on 09/06/15.
//  Copyright (c) 2015 Yoox. All rights reserved.
//

#import "SDFSingleComponentPickerViewController.h"

@interface SDFSingleComponentPickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *characterNames;

@end

@implementation SDFSingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca",@"Artoo", @"Threepio", @"Lando"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc]
                       initWithFormat:@"You selected %@!", selected];
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
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.characterNames[row];
}

@end
