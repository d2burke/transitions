//
//  CreatureTableController.h
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CreatureCell.h"

@interface CreatureTableController : NSObject
<
UITableViewDataSource,
UITableViewDelegate,
UIScrollViewDelegate,
UIGestureRecognizerDelegate
>

@property (strong, nonatomic) NSArray *creatures;

@end
