//
//  PTgoalInfoViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PTgoalInfoViewControllerDelegate <NSObject>

-(void) saveGoalInfo;

@end

@interface PTgoalInfoViewController : UIViewController
- (IBAction)doneButton:(UIBarButtonItem *)sender;
- (IBAction)backToTable:(UIButton *)sender;
@property(weak,nonatomic) id <PTgoalInfoViewControllerDelegate> delegate;



@end
