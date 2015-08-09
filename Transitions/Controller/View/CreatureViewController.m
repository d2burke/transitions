//
//  CreatureViewController.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "CreatureViewController.h"
#import "CreaturesViewController.h"
#import "TransitionCreatureToCreatures.h"

@interface CreatureViewController ()

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    self.navigationController.delegate = self;
    
    _dismissPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPanImageView:)];
    [_creatureImageView addGestureRecognizer:_dismissPanGestureRecognizer];
}

#pragma mark - UINavigationController Delegate Methods
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    // Check if we're transitioning from this view controller to a DSLSecondViewController
    if (fromVC == self && [toVC isKindOfClass:[CreaturesViewController class]]) {
        return [[TransitionCreatureToCreatures alloc] init];
    }
    else {
        return nil;
    }
}

- (void)didPanImageView:(UIPanGestureRecognizer*)recognizer{
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:{
            _touchPoint = [recognizer locationInView:_creatureImageView];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //Track the user's touchpoint as it moves and
            //adjust the position of the imageView
            CGFloat offsetY = _creatureImageView.frame.size.height/2 - _touchPoint.y;
            CGPoint trueTouchPoint = [recognizer locationInView:self.view];
            CGPoint newCenter = CGPointMake(_creatureImageView.center.x, trueTouchPoint.y + offsetY);
            _creatureImageView.center = newCenter;
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            //Trigger popViewController
            [self.navigationController popViewControllerAnimated:YES];
        }
        default:
            break;
    }
}

@end
