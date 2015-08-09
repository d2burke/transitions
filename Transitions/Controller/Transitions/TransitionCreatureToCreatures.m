//
//  TransitionCreatureToCreatures.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "TransitionCreatureToCreatures.h"

//You must import the To/From ViewControllers
#import "CreaturesViewController.h"
#import "CreatureViewController.h"

//You must import any custom classes you need to access
#import "CreatureCell.h"

@implementation TransitionCreatureToCreatures

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //Create references to the TO and FROM ViewControllers
    CreatureViewController *fromViewController = (CreatureViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CreaturesViewController *toViewController = (CreaturesViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //The ViewControllers are added to a parent container view
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    fromViewController.view.alpha = 0;
    toViewController.creatureTableView.alpha = 0;
    
    CreatureCell *cell = (CreatureCell*)[toViewController.creatureTableView cellForRowAtIndexPath:[toViewController.creatureTableView indexPathForSelectedRow]];
    cell.creatureImageView.hidden = YES;
    cell.titleLabel.hidden = YES;
    
    //Prepare the destination view controller
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView addSubview:toViewController.view];
    
    UIImageView *creatureImageView = [[UIImageView alloc] initWithImage:fromViewController.creatureImageView.image];
    creatureImageView.contentMode = UIViewContentModeScaleAspectFill;
    creatureImageView.clipsToBounds = YES;
    CGRect imageFrame = [fromViewController.view convertRect:fromViewController.creatureImageView.frame fromView:fromViewController.creatureImageView.superview];
    imageFrame.origin.y += 64; //Compensate for the nav bar
    creatureImageView.frame = imageFrame;
    
    [containerView addSubview:creatureImageView];
    
    
    //Set up the new frame for where the image should animate to
    //based on the frame of the imageView in the next view
    CGRect frame = [containerView convertRect:cell.creatureImageView.frame fromView:cell.creatureImageView.superview];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:0.25 options:UIViewAnimationOptionCurveEaseOut animations:^{
        creatureImageView.frame = frame;
        toViewController.creatureTableView.alpha = 1;
        fromViewController.view.alpha = 0;
    } completion:^(BOOL finished) {
        cell.creatureImageView.hidden = NO;
        cell.titleLabel.hidden = NO;
        [creatureImageView removeFromSuperview];
        
        //THIS IS IMPORTANT: This notifies the app that the transition is complete
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

//This provides easy access to the duration of the animation
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.6;
}


@end
