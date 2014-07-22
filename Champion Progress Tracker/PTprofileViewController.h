//
//  PTprofileViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/17/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTprofileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
@property (strong,nonatomic) UIImage * profilePic;

- (IBAction)progressTabelBUtton:(UIBarButtonItem *)sender;

@end
