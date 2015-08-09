//
//  CreaturesViewController.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "CreaturesViewController.h"
#import "CreatureViewController.h"
#import "CreatureCell.h"

@interface CreaturesViewController ()

@end

@implementation CreaturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableController = [[CreatureTableController alloc] init];
    _creatureTableView.delegate = _tableController;
    _creatureTableView.dataSource = _tableController;
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CreatureCell *cell = (CreatureCell*)[_creatureTableView cellForRowAtIndexPath:[_creatureTableView indexPathForSelectedRow]];
    CreatureViewController *toVC = (CreatureViewController*)[segue destinationViewController];
    toVC.creatureTitle = cell.titleLabel.text;
    toVC.creatureImage = cell.creatureImageView.image;
}

- (IBAction)displayFilters:(id)sender {
}
@end
