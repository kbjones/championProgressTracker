//
//  PTGoalViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTuserData.h"
#import "PTgoalInfoViewController.h"

@protocol PTGoalViewControllerDelegate <NSObject>

-(void) didSaveGoal;

@end

@interface PTGoalViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,PTGoalViewControllerDelegate,PTgoalInfoViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *targetWeightTF;
@property (strong, nonatomic) IBOutlet UITextView *fitnessGoalTV;
@property (strong,nonatomic) PTuserData *Data;
- (IBAction)saveButton:(UIBarButtonItem *)sender;
//@property (weak,nonatomic) id <PTGoalViewControllerDelegate> delegate;

@end
