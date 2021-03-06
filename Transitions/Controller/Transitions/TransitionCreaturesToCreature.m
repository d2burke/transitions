//
//  TransitionCreaturesToCreature.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "TransitionCreaturesToCreature.h"

//You must import the To/From ViewControllers
#import "CreaturesViewController.h"
#import "CreatureViewController.h"

//You must import any custom classes you need to access
#import "CreatureCell.h"

@implementation TransitionCreaturesToCreature

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //Create references to the TO and FROM ViewControllers
    CreaturesViewController *fromViewController = (CreaturesViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CreatureViewController *toViewController = (CreatureViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //The ViewControllers are added to a parent container view
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    //Create a reference to the selected cell
    NSIndexPath *selectedIndexPath = [fromViewController.creatureTableView indexPathForSelectedRow];
    CreatureCell *cell = (CreatureCell*)[fromViewController.creatureTableView cellForRowAtIndexPath:selectedIndexPath];
    cell.hidden = YES;
    
    //Update our current view to make it look like the
    //image has popped out
    fromViewController.filterButton.hidden = YES;
    
    //Prepare the destination view controller
    toViewController.titleLabel.text = cell.titleLabel.text;
    [toViewController.titleLabel sizeToFit];
    toViewController.creatureImageView.image = cell.creatureImageView.image;
    toViewController.view.alpha = 0;
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView addSubview:toViewController.view];
    
    //Take a snapshot of the view with the missing hole
    //so we can create the visual relationship
    toViewController.snapshotView = [fromViewController.view snapshotViewAfterScreenUpdates:YES];
    toViewController.snapshotView.alpha = 0;
    [toViewController.view insertSubview:toViewController.snapshotView atIndex:0];
    
    //Set up the new frame for where the image should animate to
    //based on the frame of the imageView in the next view
    CGRect frame = [containerView convertRect:toViewController.creatureImageView.frame fromView:toViewController.creatureImageView.superview];
    
    //Prepare the imageView that we'll animate
    //IMPORTANT: we MUST remember to remove this imageView when we're done
    UIImageView *creatureImageView = [[UIImageView alloc] initWithImage:cell.creatureImageView.image];
    creatureImageView.contentMode = UIViewContentModeScaleAspectFill;
    CGRect imageFrame = [fromViewController.view convertRect:cell.creatureImageView.frame fromView:cell.creatureImageView.superview];
    imageFrame.origin.y += 64;
    creatureImageView.frame = imageFrame;
    creatureImageView.clipsToBounds = YES;
    [containerView addSubview:creatureImageView];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.75 initialSpringVelocity:0.25 options:UIViewAnimationOptionCurveEaseOut animations:^{
        creatureImageView.frame = frame;
        fromViewController.creatureTableView.alpha = 0;
    } completion:^(BOOL finished) {
        
        //Reset our original viewController so it's back to normal when
        //we return.  It maintains it's state, as it is still alive on
        //the stack
        cell.hidden = NO;
        fromViewController.filterButton.hidden = NO;
        fromViewController.creatureTableView.alpha = 1;
        
        //Show the destination imageView
        toViewController.view.alpha = 1;
        
        //Hide the snapshot view
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
