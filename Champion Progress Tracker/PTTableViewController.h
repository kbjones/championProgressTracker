//
//  PTTableViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/21/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTweekViewController.h"
#import "PTgoalInfoViewController.h"

#define WEEKLY_OBJECTS @"weekly objects"


@interface PTTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate, PTweekViewControllerDelegate>


- (IBAction)addWeekButton:(UIBarButtonItem *)sender;
@property(strong,nonatomic) NSMutableArray * weeks;
@property (strong, nonatomic) IBOutlet UILabel *weekLabel;


@end
