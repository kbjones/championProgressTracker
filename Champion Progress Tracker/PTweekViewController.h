//
//  PTweekViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/21/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTuserData.h"

@protocol PTweekViewControllerDelegate <NSObject>

-(void)addWeek: (PTuserData *) userInfoObject;


@end


@interface PTweekViewController : UIViewController<UIScrollViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong,nonatomic) UIActionSheet *popup;
//@property(strong,nonatomic) IBAction takePhoto;

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
@property (strong, nonatomic) IBOutlet UITextView *sundaytV;
@property (strong, nonatomic) IBOutlet UILabel *weekWeight;
@property (strong, nonatomic) IBOutlet UITextField *weekWeightTF;
@property (strong, nonatomic) IBOutlet UIView *viewForScrolling;


@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@property(weak,nonatomic) id <PTweekViewControllerDelegate> delegate;


@property(strong,nonatomic) PTuserData * userInfoObject;


@end
