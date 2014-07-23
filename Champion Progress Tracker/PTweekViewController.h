//
//  PTweekViewController.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/21/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTuserData.h"

@interface PTweekViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *userPhoto;


@property(strong,nonatomic) PTuserData * userObject;


@end
