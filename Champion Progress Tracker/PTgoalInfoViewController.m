//
//  PTgoalInfoViewController.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTgoalInfoViewController.h"

@interface PTgoalInfoViewController ()

@end

@implementation PTgoalInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)doneButton:(UIBarButtonItem *)sender {
     [self performSegueWithIdentifier:@"toTable" sender:sender];
}

- (IBAction)backToTable:(UIButton *)sender {
    [self performSegueWithIdentifier:@"backToTable" sender:sender];
}
@end