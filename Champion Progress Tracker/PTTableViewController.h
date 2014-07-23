//
//  PTTableViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/21/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTTableViewController : UITableViewController
- (IBAction)GoalViewButton:(UIBarButtonItem *)sender;

- (IBAction)addWeekButton:(UIBarButtonItem *)sender;
@property(strong,nonatomic) NSMutableArray * weeks;
@property (strong, nonatomic) IBOutlet UILabel *weekLabel;


@end
