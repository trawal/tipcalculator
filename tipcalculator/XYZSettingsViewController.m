//
//  XYZSettingsViewController.m
//  tipcalculator
//
//  Created by Tushar Rawal on 2/23/14.
//  Copyright (c) 2014 Tushar Rawal. All rights reserved.
//

#import "XYZSettingsViewController.h"

@interface XYZSettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipValue;

- (void)updateDefaultTipValues;

@end

@implementation XYZSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateDefaultTipValues {

    int defaultTip = self.defaultTipValue.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTip forKey:@"defaultTip"];
    [defaults synchronize];
}

- (void)viewWillAppear:(BOOL)animated {
    //NSLog(@"view did appear");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTip = [defaults integerForKey:@"defaultTip"];
    
    // NSLog(@"view will disappear and updated default=%d", defaultTip);
    
    self.defaultTipValue.selectedSegmentIndex = defaultTip;
}

- (void)viewDidAppear:(BOOL)animated {
    //NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    //NSLog(@"view will disappear");
    
    [self updateDefaultTipValues];

}

- (void)viewDidDisappear:(BOOL)animated {
    //NSLog(@"view did disappear");
}


@end
