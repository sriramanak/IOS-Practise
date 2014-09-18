//
//  FirstTableViewController.m
//  JsonSample
//
//  Created by paradigm creatives on 9/18/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "FirstTableViewController.h"
#import "DataViewController.h"


@interface FirstTableViewController ()
{
    NSMutableArray *companyNames;
    NSMutableArray *description;
    
}
@end

@implementation FirstTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    companyNames=[[NSMutableArray alloc]init];
    description=[[NSMutableArray alloc]init];
    
    NSURL *jsonurl=[[NSBundle mainBundle] URLForResource:@"generated" withExtension:@"json"];
    NSError *error;
    NSString *jsonString=[NSString stringWithContentsOfURL:jsonurl encoding:NSUTF8StringEncoding error:&error];
    NSData *data=[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id jsonobj=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    NSArray *jsonarr=(NSArray *)jsonobj;
    for(NSDictionary *jsondict in jsonarr)
    {
      
      //  NSLog(@"----company name----%@",[jsondict objectForKey:@"company"]);
       // NSLog(@" desc of cmpny---%@",[jsondict objectForKey:@"about"]);
        [companyNames addObject:[jsondict objectForKey:@"company"]];
        [description addObject:[jsondict objectForKey:@"about"]];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [companyNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=[companyNames objectAtIndex:indexPath.row];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"mypush"])
    {

       DataViewController *dataview=[segue destinationViewController];
    NSIndexPath *selectedIndexpath=[[NSIndexPath alloc] init];
    selectedIndexpath=[self.tableView indexPathForSelectedRow];
    dataview.data=[description objectAtIndex:selectedIndexpath.row];
        
    }
}


@end
