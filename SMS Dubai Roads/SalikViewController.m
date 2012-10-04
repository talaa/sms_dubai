//
//  SalikViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import "SalikViewController.h"

@interface SalikViewController ()

@end

@implementation SalikViewController
@synthesize accountnumber,pinnumber,rechargecardno,smscontext;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)resignKeyboard:(id)sender
{
    [self Updatesms];
    [sender resignFirstResponder];
}
-(void)Fillingthedefaults{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults registerDefaults:[self ini
    if ([[defaults objectForKey:KSalikAccountNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KSalikAccountNo]);
    }
    [accountnumber setText:[defaults objectForKey:KSalikAccountNo]];
    
    
    if ([[defaults objectForKey:KSalikPINNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KSalikPINNo]);
    }
    [pinnumber setText:[defaults objectForKey:KSalikPINNo]];
}
- (void)viewWillAppear:(BOOL)animated{
    
    [self Fillingthedefaults];
}
-(void)Updatesms{
    smscontext.text=[NSString stringWithFormat:@"%@%@%@%@%@%@",@"R*",rechargecardno.text,@"*",accountnumber.text,@"*",pinnumber.text];
    
    
}
-(IBAction)sendsms:(id)sender{
    MFMessageComposeViewController *picker=[[MFMessageComposeViewController alloc]init];
    //NSUserDefaults *userdefault=[NSUserDefaults standardUserDefaults];
    picker.messageComposeDelegate=self;
    NSArray *receipents = [[ NSArray alloc]initWithObjects:@"5959", nil] ;
    [picker setRecipients:receipents];
    [picker setBody:smscontext.text];
    [self presentModalViewController:picker animated:YES];
    


}
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
