//
//  PTweekViewController.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/21/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTweekViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "PTuserData.h"
#import "PTDataTrasformer.h"


@interface PTweekViewController ()
- (void)showActionSheet:(id)sender;

@end

@implementation PTweekViewController

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
    [_scroller setScrollEnabled:YES];
    
  // Do any additional setup after loading the view.
 
   // NSDictionary *viewsDictionary;
    
    // Create the scroll view and the image view.
    _scroller.contentSize = CGSizeMake(320, 3000);
    
    // Add the scroll view to our view.
    [self.view addSubview:_scroller];
    [_scroller addSubview:self.viewForScrolling];
    
    
    // Set the translatesAutoresizingMaskIntoConstraints to NO so that the views autoresizing mask is not translated into auto layout constraints.
    //scroller.translatesAutoresizingMaskIntoConstraints  = NO;
   
    // Set the constraints for the scroll view and the image view.
        //viewsDictionary = NSDictionaryOfVariableBindings(scroller);
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scroller]|" options:0 metrics: 0 views:viewsDictionary]];
    //[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scroller]|" options:0 metrics: 0 views:viewsDictionary]];
    

}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"Scrolling");
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

-(void)showActionSheet:(id)sender{
    NSString *photoActionSheet = @" Would you like to upload a photo for your progress collection"; //Action Sheet Title
    NSString *destructiveTitle = @"Destructive Button"; //Action Sheet Button Titles
    NSString * takePhoto = @"Take Photo";
    NSString * uploadPhoto = @"Upload Photo";
    NSString *collectionSegue = @"Collection View";
    NSString *cancelTitle = @"Cancel Button";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:photoActionSheet
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:destructiveTitle
                                  otherButtonTitles:takePhoto, uploadPhoto, collectionSegue, nil];
    
    [actionSheet showInView:self.view];
    
}


- (IBAction)addPhoto:(UIBarButtonItem *)sender {
   
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Would you like to Upload anProgress photo:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Take a Photo",
                            @"Upload a Photo",
                            @"Photo Collection",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];

}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if  (buttonIndex == 0) {
        
        NSLog(@"Destructive pressed --> Delete Something");
        UIImagePickerController *picker1 = [[UIImagePickerController alloc] init];
        picker1.delegate = self;
        
        /* If the Camera is avaliable use it to choose the image if not then use the album */
        [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
            picker1.sourceType = UIImagePickerControllerSourceTypeCamera;
      
        
        [self presentViewController:picker1 animated:YES completion:nil];
        }
    else if (buttonIndex == 1) {
        NSLog(@"Other 1 pressed");
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        
        [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    else if (buttonIndex == 2) {
        NSLog(@"Other 2 pressed");
        [self performSegueWithIdentifier:@"toCollection" sender:nil];
    }
    else if (buttonIndex == 3) {
        NSLog(@"Third button clicked");
    }
    /*else {
        NSLog(@"Cancel pressed --> Cancel ActionSheet");
    }*/
}


/*- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    NSString *buttonTitle = [popup buttonTitleAtIndex:buttonIndex];
    
    if  (buttonIndex == 0) {
        NSLog(@"Destructive pressed --> Delete Something");
    }
    else if (buttonIndex == 1) {
        NSLog(@"Other 1 pressed");
    }
    else if (buttonIndex == 2) {
        NSLog(@"Other 2 pressed");
    }
    if (buttonIndex == 3) {
    [self performSegueWithIdentifier:@"toCollection" sender:nil];
    }
    if ([buttonTitle isEqualToString:@"Cancel Button"]) {
        NSLog(@"Cancel pressed --> Cancel ActionSheet");
    }
}*/
//
- (IBAction)uploadButton:(UIButton *)sender {
}

@end

