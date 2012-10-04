//
//  DubaiParkingViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import "DubaiParkingViewController.h"
#define KPhonetest @"Phonetest"
@interface DubaiParkingViewController ()

@end

@implementation DubaiParkingViewController
@synthesize carplatenumber,ParkingAreano,Parkinghourslabel,addhours,smscontext;
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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
-(void)Fillingthedefaults{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults registerDefaults:[self ini
    if ([[defaults objectForKey:KCarPlateNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KCarPlateNo]);
    }
    [carplatenumber setText:[defaults objectForKey:KCarPlateNo]];
    
    
}

-(IBAction)updatehours:(id)sender{
    
    Parkinghourslabel.text=[NSString stringWithFormat:@"%0.0f",addhours.value];
    NSLog(@"This is the First entry%@",smscontext.text);
    [self Updatesms];
}
-(void)Updatesms{
    smscontext.text=[NSString stringWithFormat:@"%@%@%@%@%@",carplatenumber.text,@" ",ParkingAreano.text,@" ",Parkinghourslabel.text];
    

}
-(IBAction)sendsms:(id)sender{
    MFMessageComposeViewController *picker=[[MFMessageComposeViewController alloc]init];
    //NSUserDefaults *userdefault=[NSUserDefaults standardUserDefaults];
    //[userdefault setObject:accountnumberdef.text forKey:KSalikAccountNo];
    picker.messageComposeDelegate=self;
    [picker setBody:smscontext.text];
    NSArray *receipents = [[ NSArray alloc]initWithObjects:@"7275", nil] ;
    [picker setRecipients:receipents];
    [self presentModalViewController:picker animated:YES];
    
    
    
}
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissModalViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [self Fillingthedefaults];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)resignKeyboard:(id)sender
{
    [self Updatesms];
    [sender resignFirstResponder];
}

@end
