//
//  PTweekList.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/19/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTweekList : NSObject


/* Custom Initializer which has a single parameter of class NSDictionary. */
-(id)initWithData:(NSDictionary *)data;
/*
-(id)init;
{
    self = [self initWithData:nil];
    return self;
}
*/

@end
