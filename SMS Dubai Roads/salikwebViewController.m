//
//  salikwebViewController.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 6/16/14.
//  Copyright (c) 2014 Tamer Alaa. All rights reserved.
//

#import "salikwebViewController.h"

@interface salikwebViewController () <UIWebViewDelegate>

@end

@implementation salikwebViewController
@synthesize salikwebview;

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
    
    NSURL *url =[NSURL URLWithString:@"https://customers.salik.ae/default.aspx?ReturnUrl=%2fModuleCustomer%2fMakePayment.aspx%3fculture%3deng&culture=eng"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [salikwebview loadRequest:request];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/******************************************/
#pragma mark - WebView Delegate
/******************************************/
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"finish");
}


-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error for WEBVIEW: %@", [error description]);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert" message:@"An error has been occured.Kindly try agine or later." preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
