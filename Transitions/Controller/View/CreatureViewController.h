//
//  CreatureViewController.h
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatureViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) UIImage *creatureImage;
@property (strong, nonatomic) NSString *creatureTitle;

@end
