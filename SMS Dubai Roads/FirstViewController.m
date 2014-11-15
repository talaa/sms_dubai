//
//  FirstViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize upgradebutton,salikbutton,parkingbutton,taxibutton,trafficbutton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [salikbutton.layer setCornerRadius:15.0f];
    [salikbutton.layer setMasksToBounds:YES];
    [parkingbutton.layer setCornerRadius:15.0f];
    [parkingbutton.layer setMasksToBounds:YES];
    [taxibutton.layer setCornerRadius:15.0f];
    [taxibutton.layer setMasksToBounds:YES];
    [trafficbutton.layer setCornerRadius:15.0f];
    [trafficbutton.layer setMasksToBounds:YES];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *userdefaults =[NSUserDefaults standardUserDefaults];
    //KPROUprade=YES;
    NSLog(@"The KPROUPgrade is %i",[userdefaults boolForKey:KPROUprade]);
    if ([userdefaults boolForKey:KPROUprade]) {
        upgradebutton.enabled=NO;
        upgradebutton.title=@"";
        
    }


}
- (IBAction)MakeaCall:(id)sender {
    UIDevice *device = [UIDevice currentDevice];
    if ([[device model] isEqualToString:@"iPhone"] ) {
        NSString *phoneppp=@"tel:";
        NSString *phonenumber=@"042080808";
        NSString *Phone=[phoneppp stringByAppendingString:phonenumber ] ;
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:130-032-2837"]]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:Phone]];
    } else {
        UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [Notpermitted show];
        
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
