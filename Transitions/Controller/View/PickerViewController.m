//
//  PickerViewController.m
//  Transitions
//
//  Created by Daniel Burke on 8/8/15.
//  Copyright (c) 2015 D2 Development. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPickerTap:)];
    [_snapshot addGestureRecognizer:_tapGestureRecognizer];
}

- (void)viewDidAppear:(BOOL)animated{
    _pickerBottomConstraint.constant = 0;
    [UIView animateWithDuration:0.34 animations:^{
        [self.view layoutIfNeeded];
        _snapshot.alpha = 0.4;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectOption:(id)sender {
    [self dismissPicker];
}

- (void)dismissPickerTap:(UITapGestureRecognizer*)recognizer{
    [self dismissPicker];
}

- (void)dismissPicker{
    _pickerBottomConstraint.constant = -240;
    [UIView animateWithDuration:0.34 animations:^{
        [self.view layoutIfNeeded];
        _snapshot.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            //
        }];
    }];
}

@end
