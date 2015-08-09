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
        _creatures = @[@"turtle1",@"shark2",@"ray1",@"reef1",@"fish1"];
    }
    return self;
}

#pragma mark - UITableView Delegate Methods
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_delegate didSelectItemAtIndexPath:indexPath];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _creatures.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"creature";
    CreatureCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[CreatureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.creatureImageView.image = [UIImage imageNamed:[_creatures objectAtIndex:indexPath.row]];
    return cell;
}

@end
