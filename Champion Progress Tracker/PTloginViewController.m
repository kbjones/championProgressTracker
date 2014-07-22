//
//  PTloginViewController.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/17/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTloginViewController.h"
#import "PTConstants.h"

@interface PTloginViewController ()
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


@end

@implementation PTloginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.activityIndicator.hidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]){
        //[self updateUserInformation];
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getUserData
{
    NSArray *permissionsArray = @[@"user_about_me", @"user_interests", @"user_relationships", @"user_birthday", @"user_location", @"user_relationship_details"];
    
    FBSession *session;
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden = YES;
        if (!user){
            if (!error){
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:@"The Facebook Login was Canceled" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
            else {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                [alertView show];
            }
        }
        else{
            //[self updateUserInformation];
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
        }
    }];
    NSLog(@"%@", permissionsArray);
}



- (IBAction)FBButton:(UITextField *)sender {
      [self getUserData];
}
@end

