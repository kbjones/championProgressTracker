//
//  PTCoreHelp.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/29/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTCoreHelp : NSObject

/* Helper method which returns an NSManagedObjectContext object from our App Delegate */
+(NSManagedObjectContext *)managedObjectContext;

@end
