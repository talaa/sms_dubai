//
//  TrafficViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 11/12/14.
//  Copyright (c) 2014 Tamer Alaa. All rights reserved.
//

#import "TrafficViewController.h"
#define AdID @"ca-app-pub-9978956748838024/7419739152"
@interface TrafficViewController ()

@end

@implementation TrafficViewController
@synthesize trafficwebview;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSString *webaddress=@"";
    //NSURLRequest *urlrequest=[[NSURLRequest alloc]initWithURL:[NSURL URLWithString:webaddress]];
    //[trafficwebview loadRequest:urlrequest];
    UIAlertView *checkconnection=[[UIAlertView alloc]initWithTitle:@"Internet connection" message:@"This Service Requires Internet connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [checkconnection show];
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"googlemaps" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [trafficwebview loadHTMLString:htmlString baseURL:nil];
    [self showad];
    [Flurry logEvent:@"TrafficView" timed:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)showad{
    AdBanner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    //AdBanner.adUnitID = @"a150e6c061eb67b";
    AdBanner.adUnitID = AdID;
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    AdBanner.rootViewController = self;
    [AdBanner setFrame:CGRectMake(0,
                                  self.view.frame.size.height-AdBanner.bounds.size.height-50,
                                  AdBanner.bounds.size.width,
                                  AdBanner.bounds.size.height)];
    [self.view addSubview:AdBanner];
    
    // Initiate a generic request to load it with an ad.
    [AdBanner loadRequest:[GADRequest request]];



}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
