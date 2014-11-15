//
//  DubaiParkingViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import "DubaiParkingViewController.h"
#import "Flurry.h"
#import "AppDelegate.h"
#define KPhonetest @"Phonetest"
#define AdID @"ca-app-pub-9978956748838024/7419739152"
@interface DubaiParkingViewController ()

@end

@implementation DubaiParkingViewController
@synthesize carplatenumber,ParkingAreano,Parkinghourslabel,addhours,smscontext,managedObjectContext,gotohistory,sendsms;

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
    NSUserDefaults *userdefaults =[NSUserDefaults standardUserDefaults];
    //KPROUprade=YES;
    if (![userdefaults boolForKey:KPROUprade]) {
        gotohistory.enabled=NO;
    }
    [sendsms.layer setCornerRadius:20.0f];
    [sendsms.layer setMasksToBounds:YES];
	// Do any additional setup after loading the view.
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
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

    if (managedObjectContext == nil)
    {
        managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        NSLog(@"After managedObjectContext: %@",  managedObjectContext);
    }
}


-(void)Fillingthedefaults{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults registerDefaults:[self ini
    if ([[defaults objectForKey:KCarPlateNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KCarPlateNo]);
    }
    [carplatenumber setText:[defaults objectForKey:KCarPlateNo]];
    
    
}

-(IBAction)updatehours:(id)sender{
    
    Parkinghourslabel.text=[NSString stringWithFormat:@"%0.0f",addhours.value];
    NSLog(@"This is the First entry%@",smscontext.text);
    [self Updatesms];
}
-(void)Updatesms{
    smscontext.text=[NSString stringWithFormat:@"%@%@%@%@%@",carplatenumber.text,@" ",ParkingAreano.text,@" ",Parkinghourslabel.text];
    

}
-(IBAction)sendsms:(id)sender{
    [self saveintocoredata];
    MFMessageComposeViewController *picker=[[MFMessageComposeViewController alloc]init];
    //NSUserDefaults *userdefault=[NSUserDefaults standardUserDefaults];
    //[userdefault setObject:accountnumberdef.text forKey:KSalikAccountNo];
    picker.messageComposeDelegate=self;
    [picker setBody:smscontext.text];
    NSArray *receipents = [[ NSArray alloc]initWithObjects:@"7275", nil] ;
    [picker setRecipients:receipents];
    [self presentViewController:picker animated:YES completion:nil];
    //[self presentModalViewController:picker animated:YES];
    [Flurry logEvent:@"Parking Recharge"];
    
    
}
-(void)saveintocoredata{
    //NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"Salik_History" inManagedObjectContext:managedObjectContext];
    //[fetchRequest setEntity:entity];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newsalikentry = [NSEntityDescription
                                      insertNewObjectForEntityForName:@"Parking_History"
                                      inManagedObjectContext:context];
    [newsalikentry setValue:[NSDate date] forKey:@"date"];
    [newsalikentry setValue:carplatenumber.text forKey:@"carnumber"];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    //[f setNumberStyle:NSNumberFormatterDecimalStyle];
    [f setNumberStyle:NSNumberFormatterNoStyle];
    NSNumber * myNumber = [f numberFromString:Parkinghourslabel.text];
    
    [newsalikentry setValue:myNumber forKey:@"hours"];
    [newsalikentry setValue:ParkingAreano.text forKey:@"parking_area"];
    // NSManagedObject *newManagedObject = [entity insertNewObjectForEntityForName:[entity name] inManagedObjectContext:managedObjectContext];
    // Save the context.
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    
    
}



-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
    //[controller dismissModalViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [self Fillingthedefaults];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)resignKeyboard:(id)sender
{
    [self Updatesms];
    [sender resignFirstResponder];
}

@end
