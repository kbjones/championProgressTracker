//
//  PTConstants.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/17/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTConstants.h"

@implementation PTConstants

#pragma mark - User Class

NSString *const PTCUserTagLineKey               = @"tagLine";

NSString *const PTUserProfileKey               = @"profile";
NSString *const PTUserProfileNameKey           = @"name";
NSString *const PTUserProfileFirstNameKey      = @"firstName";
NSString *const PTUserProfileLocationKey       = @"location";
NSString *const PTUserProfileGenderKey         = @"gender";
NSString *const PTUserProfileBirthdayKey       = @"birthday";
NSString *const PTUserProfileInterestedInKey   = @"interestedIn";
NSString *const PTUserProfilePictureURL        = @"pictureURL";
NSString *const PTUserProfileAgeKey            = @"age";


#pragma mark - Photo Class

NSString *const PTPhotoClassKey                = @"Photo";
NSString *const PTPhotoUserKey                 = @"user";
NSString *const PTPhotoPictureKey              = @"image";

#pragma mark - Activity Class

NSString *const PTActivityClassKey             = @"Activity";
NSString *const PTActivityTypeKey              = @"type";
NSString *const PTActivityFromUserKey          = @"fromUser";
NSString *const PTActivityToUserKey            = @"toUser";
NSString *const PTActivityPhotoKey             = @"photo";
NSString *const PTActivityTypeLikeKey          = @"like";
NSString *const PTActivityTypeDislikeKey       = @"dislike";

#pragma mark - Settings

NSString *const PTMenEnabledKey                = @"men";
NSString *const PTWomenEnabledKey              = @"women";
NSString *const PTSingleEnabledKey             = @"single";
NSString *const PTAgeMaxKey                    = @"ageMax";





@end
