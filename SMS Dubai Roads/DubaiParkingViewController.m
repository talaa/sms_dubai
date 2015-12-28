//
//  DubaiParkingViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 8/4/12.
//  Copyright (c) 2012 Tamer Alaa. All rights reserved.
//

#import "DubaiParkingViewController.h"
#import "Flurry.h"
#import "RFRateMe.h"
#import "AppDelegate.h"
#define KPhonetest @"Phonetest"
#define AdID @"ca-app-pub-8416350468865222/5854359598"


@interface DubaiParkingViewController ()
@property (nonatomic)NSArray *carplates;

@end

@implementation DubaiParkingViewController
@synthesize carplatenumber,ParkingAreano,Parkinghourslabel,addhours,smscontext,managedObjectContext,gotohistory,sendsms,carplates;

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
    ///Start App Part
    
    if (bannerView == nil) {
        bannerView = [[STABannerView alloc] initWithSize:STA_AutoAdSize  origin:CGPointMake(0, self.view.frame.size.height - 100) 
                                                withView:self.view withDelegate:nil];
        //[bannerView setAutoresizesSubviews:YES];
        //bannerView.autoresizingMask=UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:bannerView];
    }
    
    /*
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
*/
    if (managedObjectContext == nil)
    {
        managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        NSLog(@"After managedObjectContext: %@",  managedObjectContext);
    }
    [self changethecarplate];
}


-(void)Fillingthedefaults{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //[defaults registerDefaults:[self ini
    if ([[defaults objectForKey:KCarPlateNo] isEqualToString:@""]){
        NSLog(@"This is the First entry%@",[defaults objectForKey:KCarPlateNo]);
    }
    [carplatenumber setText:[defaults objectForKey:KCarPlateNo]];
    NSString *item1=[[NSString alloc]init];
    NSString *item2=[[NSString alloc]init];
    if ([defaults objectForKey:KCarPlateNo]==nil) {
        item1=KCarPlateNo;
    }else{
        item1=[defaults objectForKey:KCarPlateNo];
    
    }
    if ([defaults objectForKey:KCar2PlateNo]==nil) {
        item2=KCar2PlateNo;
    }else{
        item2=[defaults objectForKey:KCar2PlateNo];
        
    }
    carplates=@[item1,item2];
    
}
-(void)changethecarplate{
    [self.carplatenumber resignFirstResponder];
    UIPickerView *picker1 = [[UIPickerView alloc] init];
    //NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    picker1.dataSource = self;
    picker1.delegate = self;
    picker1.showsSelectionIndicator=YES;
    self.carplatenumber.inputView=picker1;
    [self Updatesms];
    NSLog(@"I am here & done ");

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
    
    [RFRateMe showRateAlert];
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


//Prepare th UI
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [carplates count];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    
    return carplates[row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
        self.carplatenumber.text = carplates[row];
        
    
    [self.carplatenumber resignFirstResponder];
    
    
}
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //STAStartAppSDK* sdk = [STAStartAppSDK sharedInstance];
    //[startAppAd loadAdWithAdPreferences:[STAAdPreferences prefrencesWithLatitude:37.3190383911 andLongitude:-121.96269989]];
}

@end
