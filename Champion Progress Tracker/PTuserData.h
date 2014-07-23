//
//  PTuserData.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

#define User_Weight @"User Weight"
#define User_Goal_Information @"User Goal Information"
#define User_Progress_Photos @"User Progress Photos"
#define Daily_information @"User Daily Information"
#define User_Diet @"User Diet"
#define Workout_Date @"Date"
#define Progress_photo @"progress Photo"


@interface PTuserData : NSObject
+(NSMutableArray*) userProgress;
@property(nonatomic) int userWeight;
@property(strong,nonatomic) NSString * userGoalInfo;
@property(strong,nonatomic) NSString * userProgressPhoto;
@property(strong,nonatomic) NSString * userDailyInfo;
@property(strong,nonatomic) NSString * userDiet;
@property(strong,nonatomic) NSDate * workoutDate;
@property(strong,nonatomic) UIImage * personalImage;
@property(strong,nonatomic) NSString * week;

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;
@end
