//
//  SalikViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <iAd/iAd.h>
#import "GADBannerView.h"
#define KSalikAccountNo @"Salik Account No:"
#define KSalikPINNo @"Salik Pin No:"
#define KPhonetest @"Phonetest"
@interface SalikViewController : UIViewController<MFMessageComposeViewControllerDelegate>{

//GADBannerView *adBanner;

}
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,retain) IBOutlet UITextField *accountnumber;
@property (nonatomic,retain) IBOutlet UITextField *pinnumber;
@property (nonatomic,retain) IBOutlet UITextField *rechargecardno;
@property (nonatomic,retain) IBOutlet UILabel *smscontext;
@property (retain, nonatomic) IBOutlet GADBannerView *adBanner;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *gotohistory;


@end
