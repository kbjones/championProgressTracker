//
//  PTTableViewController.m
//  Champion Progress Tracker
//
//  Created by Kalvin Jones on 7/21/14.
//  Copyright (c) 2014 Kalvin Jones. All rights reserved.
//

#import "PTTableViewController.h"
#import "PTcollectionViewController.h"
#import "PTuserData.h"
#import "PTTableViewController.h"
#import "PTweekViewController.h"

@interface PTTableViewController ()

@end

@implementation PTTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSMutableArray*) weeks{
    if (! _weeks)_weeks= [[NSMutableArray alloc] init];
    
    return _weeks;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.weeks=[[NSMutableArray alloc]init];
    NSArray *weekArray = [[NSArray alloc]init];
    
    for (NSMutableDictionary * weeklyData in weekArray)
    {
        NSString * personsWeekly = [NSString stringWithFormat:@"%.png", weeklyData[User_Goal_Information]];
        PTuserData * weekData = [[PTuserData alloc] initWithData: weeklyData andImage:[UIImage imageNamed:personsWeekly]];
        [self.weeks addObject:weekData];
                                 
    }
}
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]
        ) {
        if ([segue.destinationViewController isKindOfClass:[PTweekViewController class]])
        {
            PTweekViewController * nextVC = segue.destinationViewController;
            NSIndexPath * path = [self.tableView indexPathForCell:sender];
            PTweekViewController * selectedWeek = self. weeks[path.row];
            nextVC.userInfoObject = selectedWeek;
            
        }
    }
}

-(void)reorderCells{
    if (self.tableView.editing == YES)[self.tableView setEditing:NO animated:YES];
    else [self.tableView setEditing:YES animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self. weeks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    PTuserData * weekly = [ self. weeks objectAtIndex:indexPath.row];
    cell.textLabel.text = weekly.week;
    cell.imageView.image = weekly.personalImage;
   
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)GoalViewButton:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"backToGoal" sender:sender];
}

- (IBAction)addWeekButton:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toWeekVC" sender:sender];
}
@end
