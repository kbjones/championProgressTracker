//
//  PTuserData.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTuserData.h"

@implementation PTuserData

-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
}

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image{
    
    self = [super init];
    
    if(self){
        
        self.targetWeight = [data[User_Target_Weight] intValue];
        self.targetGoal = data[User_Target_Goal_Information];
        self.personalImage= data[User_Personal_Photos];
        self.mondayInfo=data[Monday_Info];
        self.tuesdayInfo=data[Tuesday_Info];
        self.wednesdayInfo=data[Wednesday_Info];
        self.thursdayInfo = data[Thursday_Info];
        self.fridayInfo=data[Friday_Info];
        self.saturdayInfo=data[Saturday_Info];
        self.sundayInfo=data[Sunday_Info];
        
    }
    
    return self;
}

@end
