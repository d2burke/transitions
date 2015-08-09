//
//  CreatureViewController.h
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatureViewController : UIViewController <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;

@property (nonatomic) CGPoint touchPoint;
@property (strong, nonatomic) UIPanGestureRecognizer *dismissPanGestureRecognizer;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;

@end
