//
//  PTprofileViewController.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/17/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTprofileViewController.h"
#import "PTConstants.h"

@interface PTprofileViewController ()

@property(strong,nonatomic) NSMutableData * pictureData;


@end

@implementation PTprofileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    FBRequest *request = [FBRequest requestForMe];
    
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        
        if (!error){
            NSDictionary *userDictionary = (NSDictionary *)result;
            
            //create URL
            NSString *facebookID = userDictionary[@"id"];
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1",facebookID]];
            
            NSMutableDictionary *userProfile = [[NSMutableDictionary alloc] initWithCapacity:8];
            if (userDictionary[@"name"]){
                userProfile[PTUserProfileNameKey] = userDictionary[@"name"];
            }
            if (userDictionary[@"first_name"]){
                userProfile[PTUserProfileFirstNameKey] = userDictionary[@"first_name"];
            }
            if (userDictionary[@"location"][@"name"]){
                userProfile[PTUserProfileLocationKey] = userDictionary[@"location"][@"name"];
            }
            if (userDictionary[@"gender"]){
                userProfile[PTUserProfileGenderKey] = userDictionary[@"gender"];
            }
            if (userDictionary[@"birthday"]){
                userProfile[PTUserProfileBirthdayKey] = userDictionary[@"birthday"];
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateStyle:NSDateFormatterShortStyle];
                NSDate *date = [formatter dateFromString:userDictionary[@"birthday"]];
                NSDate *now = [NSDate date];
                NSTimeInterval seconds = [now timeIntervalSinceDate:date];
                int age = seconds / 31536000;
                userProfile[PTUserProfileAgeKey] = @(age);
            }
            if (userDictionary[@"interested_in"]){
                userProfile[PTUserProfileInterestedInKey] = userDictionary[@"interested_in"];
            }
            if (userDictionary[@"age"]){
                userProfile[PTUserProfileAgeKey] = userDictionary[@"age"];
            }
            if ([pictureURL absoluteString]){
                userProfile[PTUserProfilePictureURL] = [pictureURL absoluteString];
            }
            
            [[PFUser currentUser] setObject:userProfile forKey:PTUserProfileKey];
            [[PFUser currentUser] saveInBackground];
            
            [self requestImage];
            self.nameLabel.text = [NSString stringWithFormat:@"Name: %@", userDictionary[@"name"]];
            self.locationLabel.text = [NSString stringWithFormat:@"Location: %@", userDictionary[@"location"][@"name"]];
            self.birthdayLabel.text = [NSString stringWithFormat:@"Birthday: %@", userDictionary[@"birthday"]];
            self.genderLabel.text = [NSString stringWithFormat:@"Gender: %@", userDictionary[@"Gender"]];
        }
        else {
            NSLog(@"Error in FB request %@", error);
        }
    }];
}

- (void)requestImage
{
    PFQuery *query = [PFQuery queryWithClassName:PTPhotoClassKey];
    [query whereKey:PTPhotoUserKey equalTo:[PFUser currentUser]];
    [query countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
        if (number == 0)
        {
            PFUser *user = [PFUser currentUser];
            
            self.pictureData = [[NSMutableData alloc] init];
            
            NSURL *profilePictureURL = [NSURL URLWithString:user[PTUserProfileKey][PTUserProfilePictureURL]];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:profilePictureURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:4.0f];
            NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
            if (!urlConnection){
                NSLog(@"Failed to Download Picture");
            }
        }
    }];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"connection did recieve data");
    [self.pictureData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading");
    self.profilePic = [UIImage imageWithData:self.pictureData];
    self.profileImage.image = self.profilePic;
    //[self uploadPFFileToParse:profileImage];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)progressTabelBUtton:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toGoal" sender:sender];
}
@end
