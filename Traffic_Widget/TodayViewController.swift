//
//  TodayViewController.swift
//  Traffic_Widget
//
//  Created by Tamer Alaa on 11/15/14.
//  Copyright (c) 2014 Tamer Alaa. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var trafficwidgetview: UIWebView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        //NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"googlemaps" ofType:@"html"];
        let bundle = NSBundle.mainBundle()
        let pathhtml = bundle.pathForResource("trafficmap", ofType: "html")
        println(pathhtml)
        let content=String(contentsOfFile: pathhtml!, encoding: NSUTF8StringEncoding, error: nil)
        //let content = String.stringWithContentsOfFile(pathhtml!,encoding: NSUTF8StringEncoding, error: nil)
        trafficwidgetview.layer.cornerRadius=50.0
        trafficwidgetview.clipsToBounds=true

        //let htmlfile = bundle.pathForResource("googlemaps", ofType: "hmtl")
        //let htmlString = String .stringWithContentsOfFile(htmlfile, encoding: NSUTF8StringEncoding, error: nil);
        //NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        trafficwidgetview .loadHTMLString(content, baseURL: nil);
        //[trafficwidgetview loadHTMLString:htmlString baseURL:nil];
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
}
