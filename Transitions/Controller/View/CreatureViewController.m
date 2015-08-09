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
            _titleLabel.hidden = YES;
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //Track the user's touchpoint as it moves and
            //adjust the position of the imageView
            CGFloat offsetY = _creatureImageView.frame.size.height/2 - _touchPoint.y;
            CGPoint trueTouchPoint = [recognizer locationInView:self.view];
            CGPoint newCenter = CGPointMake(_creatureImageView.center.x, trueTouchPoint.y + offsetY);
            _creatureImageView.center = newCenter;
            
            //Update the frame of the imageView
            CGFloat dismissalPercentage = fabs([recognizer translationInView:self.view].y) / (self.view.frame.size.height/4);
            CGFloat imageHeight = 440 - (dismissalPercentage * 160);
            imageHeight = (imageHeight > 440) ? 400 : imageHeight < 270 ? 270 : imageHeight;
            CGRect imageFrame = _creatureImageView.frame;
            imageFrame.size.height = imageHeight;
            _creatureImageView.frame = imageFrame;
            
            //Animate alpha of snapshot
            _snapshotView.alpha = dismissalPercentage;
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        default:
            break;
    }
}

@end
