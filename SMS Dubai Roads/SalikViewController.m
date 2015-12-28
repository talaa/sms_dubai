//
//  SalikViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import "SalikViewController.h"
#import "Flurry.h"
#import "AppDelegate.h"
#import "RFRateMe.h"
#define AdID @"ca-app-pub-8416350468865222/5854359598"
@interface SalikViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *valuecontrol;
@property (weak, nonatomic) IBOutlet UITextField *salikvalue;

@end

@implementation SalikViewController
@synthesize accountnumber,pinnumber,rechargecardno,smscontext,valuecontrol,salikvalue,managedObjectContext,gotohistory,adBanner
,sendsms;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)resignKeyboard:(id)sender
{
    [self Updatesms];
    [sender resignFirstResponder];
}
- (IBAction)salikvaluechanged:(id)sender {
    salikvalue.text=[valuecontrol titleForSegmentAtIndex:[valuecontrol selectedSegmentIndex] ];
}
-(void)Fillingthedefaults{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults registerDefaults:[self ini
    if ([[defaults objectForKey:KSalikAccountNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KSalikAccountNo]);
    }
    [accountnumber setText:[defaults objectForKey:KSalikAccountNo]];
    
    
    if ([[defaults objectForKey:KSalikPINNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KSalikPINNo]);
    }
    [pinnumber setText:[defaults objectForKey:KSalikPINNo]];
}
- (void)viewWillAppear:(BOOL)animated{
    
    [self Fillingthedefaults];
}
-(void)Updatesms{
    smscontext.text=[NSString stringWithFormat:@"%@%@%@%@%@%@",@"R*",rechargecardno.text,@"*",accountnumber.text,@"*",pinnumber.text];
    
    
}
-(IBAction)sendsms:(id)sender{
    [self saveintocoredata];
    MFMessageComposeViewController *picker=[[MFMessageComposeViewController alloc]init];
    //NSUserDefaults *userdefault=[NSUserDefaults standardUserDefaults];
    picker.messageComposeDelegate=self;
    NSArray *receipents = [[ NSArray alloc]initWithObjects:@"5959", nil] ;
    [picker setRecipients:receipents];
    [picker setBody:smscontext.text];
    [self presentViewController:picker animated:YES completion:nil];
    //[self presentModalViewController:picker animated:YES];
    
    [RFRateMe showRateAlert];
    [Flurry logEvent:@"Salik Recharge"];
    


}

-(void)saveintocoredata{
    //NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    //NSEntityDescription *entity = [NSEntityDescription entityForName:@"Salik_History" inManagedObjectContext:managedObjectContext];
    //[fetchRequest setEntity:entity];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newsalikentry = [NSEntityDescription
                                    insertNewObjectForEntityForName:@"Salik_History"
                                    inManagedObjectContext:context];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
    
    //NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:162000];
    
    //NSString *formattedDateString = [dateFormatter stringFromDate:date];
    [newsalikentry setValue:[NSDate date] forKey:@"date"];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myNumber = [f numberFromString:salikvalue.text];
    
    [newsalikentry setValue:myNumber forKey:@"value"];
    [newsalikentry setValue:accountnumber.text forKey:@"accountnumber"];
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

- (void)viewDidLoad
{
    NSUserDefaults *userdefaults =[NSUserDefaults standardUserDefaults];
    //KPROUprade=YES;
    NSLog(@"The KPROUPgrade is %i",[userdefaults boolForKey:KPROUprade]);
    if (![userdefaults boolForKey:KPROUprade]) {
        gotohistory.enabled=NO;
    }
    [super viewDidLoad];
    [sendsms.layer setCornerRadius:20.0f];
    [sendsms.layer setMasksToBounds:YES];
	// Do any additional setup after loading the view.
    
    /*
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    adBanner = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    
    //adBanner.adUnitID = @"a150e6c061eb67b";
    adBanner.adUnitID = AdID;
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    adBanner.rootViewController = self;
    [adBanner setFrame:CGRectMake(0,
                                     self.view.frame.size.height-adBanner.bounds.size.height-50,
                                     adBanner.bounds.size.width,
                                     adBanner.bounds.size.height)];
    [self.view addSubview:adBanner];
    
    // Initiate a generic request to load it with an ad.
    
    [adBanner loadRequest:[GADRequest request]];
    */
    if (bannerView == nil) {
        
        bannerView = [[STABannerView alloc] initWithSize:STA_AutoAdSize  origin:CGPointMake(0, self.view.frame.size.height - 100)
                                                withView:self.view withDelegate:nil];
        [bannerView setAutoresizesSubviews:YES];
        bannerView.autoresizingMask=(UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin);
        [self.view addSubview:bannerView];
    }
    if (managedObjectContext == nil)
    {
        managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        NSLog(@"After managedObjectContext: %@",  managedObjectContext);
    }
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
