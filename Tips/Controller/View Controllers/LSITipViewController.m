//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "CARTipController.h"

@interface LSITipViewController ()

// Private Properties
@property (nonatomic) double totel;
@property (nonatomic) int split;
@property (nonatomic) double percentage;
@property (nonatomic) double tip;
@property (nonatomic) CARTipController *tipController;

// MARK: - Outlets
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;
@property (weak, nonatomic) IBOutlet UILabel *splitLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageLabel;
@property (weak, nonatomic) IBOutlet UIStepper *splitStepper;
@property (weak, nonatomic) IBOutlet UISlider *tipPercentageSlider;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


// Private Methods

@end

@implementation LSITipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)calculateTip {
    
}

- (void)updateViews {
    // TODO: Use the model data to update the views
}

- (void)saveTipNamed:(NSString *)name {
    
    // TODO: Save the tip to the controller and update tableview

}

// MARK: - IBActions
- (IBAction)updateSplit:(UIStepper *)sender {
    NSLog(@"split: %f", self.splitStepper.value);
}

- (IBAction)updatePercentage:(UISlider *)sender {
    NSLog(@"slider: %f", self.tipPercentageSlider.value);
}

- (IBAction)saveTip:(UIButton *)sender {
    NSLog(@"Saved Tip!");
}


// TODO: Connect actions for splitChanged, sliderChanged, and Save Tip button


// MARK: - UITableViewDataSource

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//}

// MARK: - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

// TODO: Load the selected tip from the controller

//}

// MARK: - Alert Helper

- (void)showSaveTipAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Save Tip"
                                message:@"What name would you like to give to this tip?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Tip Name:";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save"
                                                         style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *name = [[alert.textFields firstObject] text];
        if (name.length > 0) {
            [self saveTipNamed: name];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
