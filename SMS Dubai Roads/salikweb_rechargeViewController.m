//
//  salikweb_rechargeViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 6/16/14.
//  Copyright (c) 2014 Tamer Alaa. All rights reserved.
//

#import "salikweb_rechargeViewController.h"
#import "Flurry.h"

@interface salikweb_rechargeViewController ()

@end

@implementation salikweb_rechargeViewController
@synthesize rechargecardbutton,salikwebbutton;

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
    [rechargecardbutton.layer setCornerRadius:15.0f];
    [rechargecardbutton.layer setMasksToBounds:YES];
    [salikwebbutton.layer setCornerRadius:15.0f];
    [salikwebbutton.layer setMasksToBounds:YES];
    // Do any additional setup after loading the view.
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

- (IBAction)rechargecard:(id)sender {
    [Flurry logEvent:@"Salik Recharge cards" timed:YES];
}

- (IBAction)salikweb:(id)sender {
    [Flurry logEvent:@"Salik Recharge web" timed:YES];
}
@end
