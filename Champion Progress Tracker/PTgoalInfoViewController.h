//
//  PTgoalInfoViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTuserData.h"
//#import "PTGoalViewController.h"


@protocol PTgoalInfoViewControllerDelegate <NSObject>

-(void) saveGoalInfo;

@end

@interface PTgoalInfoViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>
- (IBAction)doneButton:(UIBarButtonItem *)sender;
- (IBAction)backToTable:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *targetWeightFLabel;
@property (strong, nonatomic) IBOutlet UILabel *taregetFitnessGoal;
@property(weak,nonatomic) id <PTgoalInfoViewControllerDelegate> delegate;
@property(strong,nonatomic) PTuserData *finalData;
@property (strong, nonatomic) NSMutableArray *goals;




@end
