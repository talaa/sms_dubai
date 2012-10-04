//
//  DefaultsViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KSalikAccountNo @"Salik Account No:"
#define KSalikPINNo @"Salik Pin No:"
#define KCarPlateNo @"Car Plate No:"
#define KPhonetest @"Phonetest"

@interface DefaultsViewController : UITableViewController

@property (nonatomic,retain) IBOutlet UITextField *accountnumberdef;
@property (nonatomic,retain) IBOutlet UITextField *pinnumberdef;
@property (nonatomic,retain) IBOutlet UITextField *carplatenumberdef;
//@property (nonatomic,retain) IBOutlet UITextField *Phonetestfield;

@end
