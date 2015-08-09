//
//  CreatureViewController.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    _titleLabel.text = _creatureTitle;
    _creatureImageView.image = _creatureImage;
}

@end
