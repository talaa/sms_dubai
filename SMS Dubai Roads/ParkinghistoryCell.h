//
//  ParkinghistoryCell.h
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 10/17/13.
//  Copyright (c) 2013 Tamer Alaa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParkinghistoryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *HistoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *HoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *CarnumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *ParkingareaLabel;

@end
