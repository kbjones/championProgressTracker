//
//  PTphoto.h
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/29/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@class progressPhoto;


@interface PTphoto : NSManagedObject

@property(nonatomic,retain) id image;
@property(nonatomic,retain) progressPhoto * progressDataPhoto;

@end
@interface PTphoto (CoreDataGeneratedAccessors)

- (void)addPhotosObject:(progressPhoto *)value;
- (void)removePhotosObject:(progressPhoto *)value;
- (void)addPhotos:(NSSet *)values;
- (void)removePhotos:(NSSet *)values;
@end