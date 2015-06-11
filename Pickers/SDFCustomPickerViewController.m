//
//  SDFCustomPickerViewController.m
//  Pickers
//
//  Created by De Fano Salvatore on 09/06/15.
//  Copyright (c) 2015 Yoox. All rights reserved.
//

#import "SDFCustomPickerViewController.h"

@interface SDFCustomPickerViewController ()

@property (strong, nonatomic) NSArray *images;
@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;


@end

@implementation SDFCustomPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.images = @[
                    [UIImage imageNamed:@"seven"],
                    [UIImage imageNamed:@"bar"],
                    [UIImage imageNamed:@"crown"],
                    [UIImage imageNamed:@"cherry"],
                    [UIImage imageNamed:@"lemon"],
                    [UIImage imageNamed:@"apple"]
                    ];
    
//    srandom(time(NULL));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)spin:(id)sender {
    
    BOOL win = NO;
    NSInteger numInRow = 1;
    NSInteger lastVal = -1;
    for (int i = 0; i < 5; i++) {
        
        NSInteger newValue = random() % [self.images count];
        
        if (newValue == lastVal) {
            numInRow++;}
        else {
            numInRow = 1;
        }
        
        lastVal = newValue;
        
        [self.customPicker selectRow:newValue inComponent:i animated:YES];
        [self.customPicker reloadComponent:i];
        if (numInRow >= 3) {
            win = YES;
        }
    }
    
    if (win) {
        self.winLabel.text = @"WIN!";
    } else {
        self.winLabel.text = @"";
    }
}



#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.images count];
}

#pragma mark Picker Delegate Methods

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIImage *image = self.images[row];
    UIImageView *imageView = [
                              [UIImageView alloc] initWithImage:image
                              ];
    return imageView;
}

@end
