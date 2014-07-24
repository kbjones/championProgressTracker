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
        
        self.userWeight = [data[User_Weight] intValue];
        self.userGoalInfo = data[User_Goal_Information];
        self.personalImage= data[User_Personal_Photos];
        
    }
    
    return self;
}

@end
