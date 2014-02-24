//
//  XYZTipViewController.m
//  tipcalculator
//
//  Created by Tushar Rawal on 2/18/14.
//  Copyright (c) 2014 Tushar Rawal. All rights reserved.
//

#import "XYZTipViewController.h"
#import "XYZSettingsViewController.h"

@interface XYZTipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)onTap:(id)sender;

- (void)updateValues;

- (void)onSettingsButton;

@end

@implementation XYZTipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonSystemItemAction target:self action:@selector(onSettingsButton)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex]floatValue];
    
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLable.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[XYZSettingsViewController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {

    // Do NOT reset the tip % if there is an existing calculation on the page
    float billAmount = [self.billTextField.text floatValue];
    
    if (!billAmount || billAmount == 0) {
        // Set the value based on selected default value in Settings page
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        int defaultTip = [defaults integerForKey:@"defaultTip"];
    
        // NSLog(@"view will appear and updated default=%d", defaultTip);
    
        self.tipControl.selectedSegmentIndex = defaultTip;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    //NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    //NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    //NSLog(@"view did disappear");
}

@end
