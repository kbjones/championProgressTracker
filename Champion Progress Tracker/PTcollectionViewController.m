//
//  PTcollectionViewController.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/22/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTcollectionViewController.h"
#import "PTDataTrasformer.h"
#import "PTprogressCollectionCell.h"
#import "PTphoto.h"
#import "PTCoreHelp.h"

@interface PTcollectionViewController ()
@property(strong,nonatomic) NSMutableArray * photos;


@end

@implementation PTcollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSMutableArray *)photos
{
    if (!_photos){
        _photos = [[NSMutableArray alloc] init];
    }
    return _photos;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    /* Call to the super classes implementation of viewWillAppear */
    [super viewWillAppear:YES];
    
    /* The Photos are stored in Core Data as an NSSet. */
    NSSet *orderedPhotos = self.photos;
    /* To organize them we use a NSSort descriptor to arrange the photos by date. */
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"%" ascending:YES];
    NSArray *sortedPhotos = [orderedPhotos sortedArrayUsingDescriptors:@[dateDescriptor]];
    self.photos = [sortedPhotos mutableCopy];
    
    /* Now that the photos are arranged we reload our CollectionView. */
    [self.collectionView reloadData];
}

// Display the photos stored in the photo's array */
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"progressCell";
    
    PTprogressCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /* Access the correct photo from the photo's array */
    PTphoto *photo = self.photos[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = photo.image;
    
    return cell;
}
/* Number of items in the collection view should be equal to the number of photos in the photos array */
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}

#pragma mark - UIImagePickerControllerDelegate

/* If the user picks chooses media this delegate method will fire. Using the parameters we can determine which media object they selected. */
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if(!image) image = info[UIImagePickerControllerOriginalImage];
    
    [self.photos addObject:[self photoFromImage:image]];
    
    [self.collectionView reloadData];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (PTphoto *)photoFromImage:(UIImage *)image
{
    /* Create a photo object using the method insertNewObjectForEntityForName for the entity name Photo */
    PTphoto *photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:[PTCoreHelp managedObjectContext]];
    /* Set the photo's attributes */
    PTphoto.image = photo;
    //photo.date = [NSDate date];
    PTphoto.progressPhoto = self.photos;
    
    NSError *error = nil;
    /* Save the photo, the if statement evaluates to true if there is an error */
    if (![[photo managedObjectContext] save:&error]){
        //Error in saving
        NSLog(@"%@", error);
    }
    NSLog(@"Saved");
    return photo;
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

@end
