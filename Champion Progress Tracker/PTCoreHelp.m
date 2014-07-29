//
//  PTCoreHelp.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/29/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTCoreHelp.h"

@implementation PTCoreHelp

/* Class method which first gets a variable that points to an instance of our App Delegate. Using this instance we get the NSManagedObjectContext for our application. */
+(NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    
    return context;
}


@end
