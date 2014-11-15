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

@interface TrafficViewController : UIViewController{
GADBannerView *AdBanner;
}
@property (nonatomic,strong)IBOutlet UIWebView *trafficwebview;

@end
