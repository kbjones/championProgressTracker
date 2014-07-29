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
    self.goals = [[NSMutableArray alloc]init];
    [self didAddGoal:self.finalData];
    self.targetWeightFLabel.text = [NSString stringWithFormat:@"%i",self.finalData.targetWeight];
    self.taregetFitnessGoal.text = self.finalData.targetGoal;
    
    //NSArray *employeesAsPropertyLists = [[NSArray alloc]init];
    
//    for (NSDictionary *dictionary in employeesAsPropertyLists){
//        PTuserData *userData = [self goalObjectForDictionary:dictionary];
//        [self.goals addObject:userData];
//    }
//    [self didAddGoal:self.finalData];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"Optima" size:15],
      NSFontAttributeName, nil]];
}

-(void)didsaveGoalInfo
{
    //self.targetWeightFLabel.text = [NSString stringWithFormat:@"@%i",self.finalData.targetWeight ];
    //self.taregetFitnessGoal.text = self.finalData.targetGoal;
    [self.delegate saveGoalInfo];
    
}
/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue. destinationViewController isKindOfClass:[PTGoalViewController class]]) {
        PTGoalViewController * goalVC = segue.destinationViewController;
        goalVC.goalData= self.finalData;
        goalVC.delegate = self;
        
    }
}
*/
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

-(void) didAddGoal:(PTuserData *)data
{
    //[_goals addObject:data];
    self.taregetFitnessGoal.text = data.targetGoal;
    self.targetWeightFLabel.text = [NSString stringWithFormat:@"%i", data.targetWeight];
}

-(PTuserData *)goalObjectForDictionary:(NSDictionary *)dictionary
{
    PTuserData *goalObject = [[PTuserData alloc] initWithData:dictionary];
    return goalObject;
}



- (IBAction)doneButton:(UIBarButtonItem *)sender {
     [self performSegueWithIdentifier:@"toTable" sender:sender];
}

- (IBAction)backToTable:(UIButton *)sender {
    [self performSegueWithIdentifier:@"backToTable" sender:sender];
}
@end
