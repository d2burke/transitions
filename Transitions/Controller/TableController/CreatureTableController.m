//
//  CreatureTableController.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "CreatureTableController.h"
#import "CreatureCell.h"

@implementation CreatureTableController

-(id)init{
    self = [super init];
    if(self){
        _creatures = @[
                       @{@"image":@"turtle1", @"description":@"Sea turtles are beautiful and rare.  You might see a share before one of these"},
                       @{@"image":@"shark2",@"description":@"For Great White Sharks, everything is on the menu, including you"},
                       @{@"image":@"ray1", @"description":@"Rays like this can be nearly the length of a school bus"},
                       @{@"image":@"reef1", @"description":@"Coral Reefs are home to millions of organisms"},
                       @{@"image":@"fish1", @"description":@"Schools of fish in the FL Keys will swim right around you"}
                    ];
    }
    return self;
}

#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _creatures.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"creature";
    CreatureCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[CreatureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.titleLabel.text = [[_creatures objectAtIndex:indexPath.row] objectForKey:@"description"];
    [cell.titleLabel sizeToFit];
    cell.creatureImageView.image = [UIImage imageNamed:[[_creatures objectAtIndex:indexPath.row] objectForKey:@"image"]];
    return cell;
}

@end
