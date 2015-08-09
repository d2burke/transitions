//
//  CreaturesViewController.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "CreaturesViewController.h"
#import "CreatureViewController.h"
#import "PickerViewController.h"
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
    self.navigationController.delegate = self;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowCreature"]){
        CreatureCell *cell = (CreatureCell*)[_creatureTableView cellForRowAtIndexPath:[_creatureTableView indexPathForSelectedRow]];
        CreatureViewController *toVC = (CreatureViewController*)[segue destinationViewController];
        toVC.creatureTitle = cell.titleLabel.text;
        toVC.creatureImage = cell.creatureImageView.image;
    }
    else if ([segue.identifier isEqualToString:@"ShowPicker"]){
        PickerViewController *toVC = (PickerViewController*)[segue destinationViewController];
        
        //Grab the FULL view snapshot
        toVC.snapshot = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
        [toVC.view insertSubview:toVC.snapshot atIndex:0];
    }
}

#pragma mark - UINavigationController Delegate Methods
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    // Check if we're transitioning from this view controller to a DSLSecondViewController
    if (fromVC == self && [toVC isKindOfClass:[CreatureViewController class]]) {
        return [[TransitionCreaturesToCreature alloc] init];
    }
    else {
        return nil;
    }
}

- (IBAction)displayFilters:(id)sender {
}
@end
