//
//  DefaultsViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import "DefaultsViewController.h"

@interface DefaultsViewController ()

@end

@implementation DefaultsViewController
@synthesize accountnumberdef,pinnumberdef,carplatenumberdef;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)saveuserdefaults:(id)sender{
    NSUserDefaults *userdefault=[NSUserDefaults standardUserDefaults];
    [userdefault setObject:accountnumberdef.text forKey:KSalikAccountNo];
    [userdefault setObject:pinnumberdef.text forKey:KSalikPINNo];
    [userdefault setObject:carplatenumberdef.text forKey:KCarPlateNo];
    //[userdefault setObject:Phonetestfield.text forKey:KPhonetest];
    
    [sender resignFirstResponder];
}
-(void)Fillingthedefaults{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults registerDefaults:[self ini
    if ([[defaults objectForKey:KSalikAccountNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KSalikAccountNo]);
    }
    [accountnumberdef setText:[defaults objectForKey:KSalikAccountNo]];
    
    
    if ([[defaults objectForKey:KSalikPINNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KSalikPINNo]);
    }
    [pinnumberdef setText:[defaults objectForKey:KSalikPINNo]];
    if ([[defaults objectForKey:KCarPlateNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KCarPlateNo]);
    }
    [carplatenumberdef setText:[defaults objectForKey:KCarPlateNo]];
    /*
    if ([[defaults objectForKey:KPhonetest] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KPhonetest]);
    }
    */

}
- (void)viewWillAppear:(BOOL)animated{
    [self Fillingthedefaults];
}

- (void)viewDidLoad
{
    
    //self.tableView.backgroundColor=[UIColor blueColor];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)resignKeyboard:(id)sender
{
    [sender resignFirstResponder];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source






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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate



@end
