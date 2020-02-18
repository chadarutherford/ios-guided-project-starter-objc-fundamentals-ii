//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "CARTipController.h"
#import "CARTip.h"

@interface LSITipViewController () <UITableViewDelegate, UITableViewDataSource>

// Private Properties
@property (nonatomic) double total;
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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tipController = [[CARTipController alloc] init];
    [self.totalTextField addTarget:self action:@selector(calculateTip) forControlEvents:UIControlEventEditingDidEndOnExit];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)calculateTip {
    self.percentage = round(self.tipPercentageSlider.value);
    self.total = [self.totalTextField.text doubleValue];
    self.split = self.splitStepper.value;
    double tipAmount = self.total * (self.percentage / 100.0);
    self.tip = tipAmount / self.split;
    NSLog(@"tip: %0.2f", self.tip);
    [self updateViews];
}

- (void)updateViews {
    self.tipPercentageSlider.value = self.percentage;
    self.splitLabel.text = [NSString stringWithFormat:@"%d", self.split];
    self.tipPercentageLabel.text = [NSString stringWithFormat:@"%0.0f%%", self.percentage];
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", self.tip];
}

- (void)saveTipNamed:(NSString *)name {
    [self.tipController createTipWithName:name
                                    total:self.total
                               splitCount:self.split
                            tipPercentage:self.percentage];
    [self.tableView reloadData];
}

// MARK: - IBActions
- (IBAction)updateSplit:(UIStepper *)sender {
    [self calculateTip];
}

- (IBAction)updatePercentage:(UISlider *)sender {
    [self calculateTip];
}

- (IBAction)saveTip:(UIButton *)sender {
    [self showSaveTipAlert];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tipController.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
    CARTip *tip = [self.tipController.tips objectAtIndex:indexPath.row];
    cell.textLabel.text = tip.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%0.2f", tip.total];
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CARTip *tip = [self.tipController.tips objectAtIndex:indexPath.row];
    self.total = tip.total;
    self.totalTextField.text = [NSString stringWithFormat:@"$%0.2f", tip.total];
    self.percentage = tip.tipPercentage;
    self.split = tip.splitCount;
    double tipAmount = self.total * (self.percentage / 100.0);
    self.tip = tipAmount / self.split;
    [self updateViews];
}

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
