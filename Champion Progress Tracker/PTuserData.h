//
//  PTuserData.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

#define User_Target_Weight @"User Target Weight"
#define User_Target_Goal_Information @"User  target Goal Information"
#define User_Personal_Photos @"User Presonal Photos"
#define Daily_information @"User Daily Information"
#define Monday_Info @"Monday Info"
#define Tuesday_Info @"Tuesday Info"
#define Wednesday_Info @"Wednesday Info"
#define Thursday_Info @"Thursday Info"
#define Friday_Info @"Friday Info"
#define Saturday_Info @"Saturday Info"
#define Sunday_Info @"Sunday Info"
#define User_Diet @"User Diet"
#define Workout_Date @"Date"



@interface PTuserData : NSObject
+(NSMutableArray*) userProgress;

@property(strong,nonatomic) NSString * userGoalInfo;
@property(nonatomic) int targetWeight;
@property(strong,nonatomic) NSString *targetGoal;
@property(strong,nonatomic) NSString * week; 
//@property(strong,nonatomic) NSString * userProgressPhoto;
@property(strong,nonatomic) NSString * userDailyInfo;
@property(strong,nonatomic) NSString * userDiet;
@property(strong,nonatomic) NSString * mondayInfo;
@property(strong,nonatomic)NSString * tuesdayInfo;
@property(strong,nonatomic)NSString * wednesdayInfo;
@property(strong,nonatomic)NSString * thursdayInfo;
@property(strong,nonatomic)NSString * fridayInfo;
@property(strong,nonatomic) NSString * saturdayInfo;
@property(strong,nonatomic) NSString * sundayInfo;
@property(nonatomic) int weeklyWeight;
@property(strong,nonatomic) NSDate * workoutDate;
@property(strong,nonatomic) UIImage * personalImage;

@property(strong,nonatomic) PTuserData * weeklyData;
@property(strong,nonatomic) PTuserData *targetData;

-(id)initWithData:(NSDictionary *)data;
@end
