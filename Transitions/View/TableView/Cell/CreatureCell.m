//
//  CreatureCell.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "CreatureCell.h"

@implementation CreatureCell

- (void)awakeFromNib {
    _titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    _titleLabel.layer.shadowOffset = CGSizeMake(2, 2);
    _titleLabel.layer.shadowOpacity = 0.6;
    _titleLabel.layer.shadowRadius = 3.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
