//
//  ParkinghistoryCell.m
//  SMS Dubai Roads
//
//  Created by Tamer Alaa on 10/17/13.
//  Copyright (c) 2013 Tamer Alaa. All rights reserved.
//

#import "ParkinghistoryCell.h"

@implementation ParkinghistoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor orangeColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
