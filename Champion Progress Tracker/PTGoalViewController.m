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

-(PTuserData *)goalData
{
    if(!_goalData)
    {
        _goalData = [[PTuserData alloc]init];
    }
    return _goalData;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.targetWeightTF.delegate = self;
    self.fitnessGoalTV.delegate=self;
    
    
    
    //self.targetWeightTF= [NSString stringWithFormat:@"%@",self.goalData.text];
    //self.fitnessGoalTV.text= self.goalData.userGoalInfo;
    self.goalData.targetWeight = [self.targetWeightTF.text intValue];
    self.goalData.targetGoal = self.fitnessGoalTV.text;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[PTgoalInfoViewController class]])
    {
        PTgoalInfoViewController *goalInfo = segue.destinationViewController;
        goalInfo.finalData= self.goalData;
        goalInfo.delegate = self;
    }
}

/*-(PTuserData *)returnDataObject
{
    PTuserData *dataObject = [[PTuserData alloc] init];
    dataObject.targetWeight = [self.targetWeightTF.text intValue];
    dataObject.targetGoal = self.fitnessGoalTV.text;
    NSLog(@"%i", dataObject.targetWeight);
    return dataObject;
}*/
    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    
#pragma  mark - TextFieldDelegate
    
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.targetWeightTF resignFirstResponder];
    [self.fitnessGoalTV resignFirstResponder];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
 
        [textField resignFirstResponder];
    
    
    return YES;
}




- (IBAction)saveButton:(UIBarButtonItem *)sender {
    //[self.delegate didAddGoal:[self returnDataObject]];
    self.goalData.targetWeight = [self.targetWeightTF.text intValue];
    self.goalData.targetGoal = self.fitnessGoalTV.text;
    //NSLog(@"%i", self.goalData.targetWeight);
    [self performSegueWithIdentifier:@"toGoalInfo" sender:sender];
}

@end
