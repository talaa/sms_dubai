//
//  DubaiParkingViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import <iAd/iAd.h>
#import <StartApp/StartApp.h>


#define KCarPlateNo @"Car 1 Plate No:"
#define KCar2PlateNo @"Car 2 Plate No:"
@interface DubaiParkingViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,MFMessageComposeViewControllerDelegate>{
GADBannerView *AdBanner;
    STABannerView* bannerView;
    STAStartAppAd *startAppAd;
}
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,retain) IBOutlet UITextField *carplatenumber;
@property (nonatomic,retain) IBOutlet UITextField *ParkingAreano;
@property (nonatomic,retain)IBOutlet UILabel *smscontext;
@property (nonatomic,retain) IBOutlet UIStepper *addhours;
@property (nonatomic,retain) IBOutlet UILabel *Parkinghourslabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *gotohistory;
@property (weak, nonatomic) IBOutlet UIButton *sendsms;


@end
