//
//  TrafficViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 11/12/14.
//  Copyright (c) 2014 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flurry.h"
#import "GADBannerView.h"
#import <StartApp/StartApp.h>

@interface TrafficViewController : UIViewController <STADelegateProtocol>
{
    GADBannerView *AdBanner;
    STABannerView *bannerView;
}
@property (nonatomic,strong)IBOutlet UIWebView *trafficwebview;

@end
