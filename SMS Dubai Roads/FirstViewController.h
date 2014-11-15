//
//  FirstViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *upgradebutton;
@property (weak, nonatomic) IBOutlet UIButton *salikbutton;
@property (weak, nonatomic) IBOutlet UIButton *parkingbutton;
@property (weak, nonatomic) IBOutlet UIButton *taxibutton;
@property (weak, nonatomic) IBOutlet UIButton *trafficbutton;
@end
