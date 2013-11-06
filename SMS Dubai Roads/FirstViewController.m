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
@synthesize upgradebutton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
