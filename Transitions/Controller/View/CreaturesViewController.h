//
//  CreaturesViewController.h
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreatureTableController.h"
#import "CreatureCell.h"

@interface CreaturesViewController : UIViewController

@property (strong, nonatomic) CreatureTableController *tableController;
@property (weak, nonatomic) IBOutlet UITableView *creatureTableView;
@property (weak, nonatomic) IBOutlet UIButton *filterButton;

@end
