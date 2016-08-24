//
//  ViewController.m
//  hengshu
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightViewLeasingLayout;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewBottomTopLayout;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topToBottomLayout;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewRightLayout;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewSpaceLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self updateConstraintsForMode:[[UIApplication sharedApplication]statusBarOrientation]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
//    [self.view layoutIfNeeded];
    [UIView animateWithDuration:duration animations:^{
        [self updateConstraintsForMode:toInterfaceOrientation];
//
    }];
}

-(void)updateConstraintsForMode:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (toInterfaceOrientation==UIDeviceOrientationPortrait)
    {
        self.topViewBottomTopLayout.priority=UILayoutPriorityDefaultHigh+1;
        self.topToBottomLayout.priority=UILayoutPriorityDefaultHigh+1;
        self.rightViewLeasingLayout.priority=UILayoutPriorityDefaultHigh+1;
        
    }else
    { self.topToBottomLayout.priority=UILayoutPriorityDefaultHigh-1;
        self.topViewBottomTopLayout.priority = UILayoutPriorityDefaultHigh-1;
        self.rightViewLeasingLayout.priority=UILayoutPriorityDefaultHigh-1;
    }

}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration {
    
    [UIView animateWithDuration:duration animations:^{
        
        [self updateConstraintsForMode:interfaceOrientation];
        //        [self.view layoutIfNeeded];
    }];
    
    }

@end
