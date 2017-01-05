//
//  SecondViewController.m
//  画面旋转测试
//
//  Created by TianWan on 2017/1/5.
//  Copyright © 2017年 天玩. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"second";
    self.view.backgroundColor = [UIColor orangeColor];
//    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait) {
        NSLog(@"UIInterfaceOrientationPortrait");
    }else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        NSLog(@"UIInterfaceOrientationPortraitUpsideDown");
    }else if (orientation == UIInterfaceOrientationLandscapeLeft) {
        NSLog(@"UIInterfaceOrientationLandscapeLeft");
    }else if (orientation == UIInterfaceOrientationLandscapeRight){
        NSLog(@"UIInterfaceOrientationLandscapeRight");
    }else {
        NSLog(@"UIInterfaceOrientationUnknown");
    }
}

- (BOOL)shouldAutorotate
{
    return NO;
}


-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        NSLog(@"UIInterfaceOrientationPortrait");
    }else if (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        NSLog(@"UIInterfaceOrientationPortraitUpsideDown");
    }else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        NSLog(@"UIInterfaceOrientationLandscapeLeft");
    }else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight){
        NSLog(@"UIInterfaceOrientationLandscapeRight");
    }else {
        NSLog(@"UIInterfaceOrientationUnknown");
    }
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    //viewController初始显示的方向
    return UIInterfaceOrientationPortrait;
}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    //viewController所支持的全部旋转方向
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
//}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    //viewController所支持的全部旋转方向
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark  比较准，不受应用设置限制
- (void)change:(NSNotification *)noti
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait) {
        NSLog(@"UIInterfaceOrientationPortrait");
    }else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        NSLog(@"UIInterfaceOrientationPortraitUpsideDown");
    }else if (orientation == UIInterfaceOrientationLandscapeLeft) {
        NSLog(@"UIInterfaceOrientationLandscapeLeft");
    }else if (orientation == UIInterfaceOrientationLandscapeRight){
        NSLog(@"UIInterfaceOrientationLandscapeRight");
    }else {
        NSLog(@"UIInterfaceOrientationUnknown");
    }
}

@end
