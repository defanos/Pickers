//
//  SDFDatePickerViewController.m
//  Pickers
//
//  Created by De Fano Salvatore on 09/06/15.
//  Copyright (c) 2015 Yoox. All rights reserved.
//

#import "SDFDatePickerViewController.h"

@interface SDFDatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation SDFDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDate *now = [NSDate date];
    [self.datePicker setDate:now animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSDate *selected = [self.datePicker date];
    NSString *message = [[NSString alloc] initWithFormat:
                         @"The date and time you selected is: %@", selected];
    UIAlertView *alert = [
                          [UIAlertView alloc]
                          initWithTitle:@"Date and Time Selected"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"That’s so true!"
                          otherButtonTitles:nil
                          ];
    [alert show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
