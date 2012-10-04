//
//  DubaiParkingViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#define KCarPlateNo @"Car Plate No:"
@interface DubaiParkingViewController : UIViewController<MFMessageComposeViewControllerDelegate>

@property (nonatomic,retain) IBOutlet UITextField *carplatenumber;
@property (nonatomic,retain) IBOutlet UITextField *ParkingAreano;
@property (nonatomic,retain)IBOutlet UILabel *smscontext;
@property (nonatomic,retain) IBOutlet UIStepper *addhours;
@property (nonatomic,retain) IBOutlet UILabel *Parkinghourslabel;

@end
