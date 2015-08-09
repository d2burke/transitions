//
//  CreaturesViewController.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "CreaturesViewController.h"
#import "CreatureViewController.h"
#import "TransitionCreaturesToCreature.h"

@interface CreaturesViewController ()

@end

@implementation CreaturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableController = [[CreatureTableController alloc] init];
    _tableController.delegate = self;
    
    _creatureTableView.delegate = _tableController;
    _creatureTableView.dataSource = _tableController;
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.transitioningDelegate = self;
    self.navigationController.delegate = self;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
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

#pragma mark - CreatureTableControllerDelegate
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Row: %i", (int)indexPath.row);
}

- (IBAction)displayFilters:(id)sender {
}
@end
