//
//  PTGoalViewController.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTGoalViewController.h"
#import "PTgoalInfoViewController.h"

@interface PTGoalViewController ()

@end

@implementation PTGoalViewController

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
    self.targetWeightTF.delegate = self;
    self.fitnessGoalTV.delegate = self;
    
    self.targetWeightTF.text = [NSString stringWithFormat:@"%i",self.Data.userWeight];
    self.fitnessGoalTV.text= self.Data.userGoalInfo;
   
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[PTgoalInfoViewController class]])
    {
        PTgoalInfoViewController *goalInfo = segue.destinationViewController;
        goalInfo.delegate= self;
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.targetWeightTF resignFirstResponder];
    [self.fitnessGoalTV resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
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




- (IBAction)saveButton:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toGoalInfo" sender:sender];
}
@end
