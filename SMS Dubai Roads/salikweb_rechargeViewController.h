//
//  salikweb_rechargeViewController.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 6/16/14.
//  Copyright (c) 2014 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface salikweb_rechargeViewController : UIViewController
- (IBAction)rechargecard:(id)sender;
- (IBAction)salikweb:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *rechargecardbutton;
@property (weak, nonatomic) IBOutlet UIButton *salikwebbutton;
@end
