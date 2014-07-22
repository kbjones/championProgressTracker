//
//  PTweekViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/21/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTweekViewController : UIViewController<UIScrollViewDelegate>
- (IBAction)addPhoto:(UIBarButtonItem *)sender;

- (IBAction)uploadButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *photoUpload;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *mondayLabel;
@property (strong, nonatomic) IBOutlet UITextView *mondayTV;
@property (strong, nonatomic) IBOutlet UILabel *tuesdayLabel;
@property (strong, nonatomic) IBOutlet UITextView *tuesdayTV;
@property (strong, nonatomic) IBOutlet UILabel *wednesdayLabel;
@property (strong, nonatomic) IBOutlet UITextView *wednesdayTV;
@property (strong, nonatomic) IBOutlet UILabel *thursdayLabel;
@property (strong, nonatomic) IBOutlet UITextView *thursdayTV;
@property (strong, nonatomic) IBOutlet UILabel *fridayLabel;
@property (strong, nonatomic) IBOutlet UITextView *fridayTV;
@property (strong, nonatomic) IBOutlet UILabel *saturdayLabel;
@property (strong, nonatomic) IBOutlet UITextView *saturdayTV;
@property (strong, nonatomic) IBOutlet UILabel *sundayLabel;
@property (strong, nonatomic) IBOutlet UITextView *sundayTV;
@property (strong, nonatomic) IBOutlet UILabel *nextWeekLabel;
@property (strong, nonatomic) IBOutlet UITextView *nextGoalTV;
@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UITextField *weightTB;

@end
