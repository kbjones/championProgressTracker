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
    
    NSArray * weeksAsList = [[NSUserDefaults standardUserDefaults] arrayForKey:WEEKLY_OBJECTS];
    
    for (NSDictionary * weekDictionary in weeksAsList)
    {
        PTuserData * weekData= [self weeklyObjectsForObjects:weekDictionary];
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


-(void) didAddWeek: (PTuserData *) weekly
{
    [self.weeks addObject:weekly];
    
    NSMutableArray * weekAsPropertyList = [[[NSUserDefaults standardUserDefaults] arrayForKey:WEEKLY_OBJECTS]mutableCopy];
    if (!weekAsPropertyList) weekAsPropertyList = [[NSMutableArray alloc] init];
    
    [weekAsPropertyList addObject:[self weeksObject:weekly]];
    [[NSUserDefaults standardUserDefaults] setObject:weekAsPropertyList forKey:WEEKLY_OBJECTS];
     [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
}

-(NSDictionary *) weeksObject:(PTuserData *) weekRec
{
    NSDictionary * weekDictionary = @{Monday_Info : weekRec.mondayInfo, Tuesday_Info : weekRec, Wednesday_Info : weekRec.wednesdayInfo, Thursday_Info : weekRec.thursdayInfo, Friday_Info : weekRec.fridayInfo, Saturday_Info : weekRec.saturdayInfo, Sunday_Info : weekRec.sundayInfo};
    return weekDictionary;
    
}

-(PTuserData *) weeklyObjectsForObjects :(NSDictionary *) weeksObject
{
    PTuserData * weeklyObject = [[PTuserData alloc] initWithData:weeksObject];
    return weeklyObject;
    
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

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    PTuserData * weekly = self.weeks[indexPath.row];
    cell.textLabel.text = weekly.week;
    //cell.imageView.image = weekly.personalImage;
    
   //for (int i = 0; i <[]; i++) {
    
   // }
   
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.weeks removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        NSMutableArray * newWeek = [[NSMutableArray alloc] init];
        
        for (PTuserData * weekRec in self.weeks) {
            [newWeek addObject:[self weeksObject:weekRec]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:newWeek forKey:WEEKLY_OBJECTS];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
}

-(void) saveWeekly
{
    NSMutableArray * weekAsPropertyList =[[NSMutableArray alloc] init];
    for (int w =0 ; w < [self. weeks count]; w++) {
        [weekAsPropertyList addObject:[self weeksObject:self.weeks[w]]];
    }
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    PTuserData *weekObj = self.weeks[fromIndexPath.row];
    [self.weeks removeObjectAtIndex:fromIndexPath.row];
    [self.weeks insertObject:weekObj atIndex:toIndexPath.row];
    [self saveWeekly];
}


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
    [self performSegueWithIdentifier:@"toAddWeek" sender:sender];
}
@end
