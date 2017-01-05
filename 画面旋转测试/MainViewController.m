//
//  MainViewController.m
//  画面旋转测试
//
//  Created by TianWan on 2017/1/5.
//  Copyright © 2017年 天玩. All rights reserved.
//
#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight  [UIScreen mainScreen].bounds.size.height
#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *bg;
@property (weak, nonatomic) IBOutlet UIView *subView;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"tranform";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
    [self adjustUI];
}

- (void)adjustUI
{
    self.bg.frame = CGRectMake(0, 0, kUIScreenWidth, kUIScreenWidth * 9/16);
    self.subView.frame = CGRectMake(0, 0, kUIScreenWidth, kUIScreenWidth * 9/16);
    self.subView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.btn.frame = CGRectMake(kUIScreenWidth - 70 - 8, kUIScreenWidth * 9/16 - 30 - 8 , 70, 30);
    self.btn.autoresizingMask =  UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
}

//- (BOOL)shouldAutorotate
//{
//    return NO;
//}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft;
//}

- (IBAction)tranfrom:(id)sender
{
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//        [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:@(UIDeviceOrientationLandscapeLeft)];
//    }
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft animated:YES];
//    [UIApplication sharedApplication]
//    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
//    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
//    self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
//    self.view.bounds = CGRectMake(0, 0, kUIScreenHeight, 320);
    
//    UIApplication *application=[UIApplication sharedApplication];
//    [application setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
//    application.keyWindow.transform=CGAffineTransformMakeRotation(M_PI);
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    if (self.bg.bounds.size.width == kUIScreenWidth) {
        [self.bg removeFromSuperview];
        [self.view.window addSubview:self.bg];
        self.bg.frame = CGRectMake(0, 64, kUIScreenWidth, kUIScreenWidth * 9/16);
        [UIView animateWithDuration:0.25 animations:^{
            self.bg.frame = CGRectMake(0, 0, kUIScreenHeight, kUIScreenWidth);
            self.btn.frame = CGRectMake(kUIScreenHeight - 70 - 8, kUIScreenWidth - 30 - 8, 70, 30);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                CGFloat anchorX = kUIScreenWidth/2/kUIScreenHeight;
                CGFloat anchorY = 0.5;
                self.bg.layer.anchorPoint = CGPointMake(anchorX, anchorY);
                self.bg.layer.position = CGPointMake(kUIScreenWidth/2, kUIScreenWidth/2);
                self.bg.layer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
            }];
        }];

    }else {
        [UIView animateWithDuration:0.25 animations:^{
            self.bg.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
               self.bg.frame = CGRectMake(0, 64, kUIScreenWidth, kUIScreenWidth * 9/16);
            } completion:^(BOOL finished) {
                [self.bg removeFromSuperview];
                [self.view addSubview:self.bg];
                self.bg.frame = CGRectMake(0, 0, kUIScreenWidth, kUIScreenWidth * 9/16);
                self.btn.frame = CGRectMake(kUIScreenWidth - 70 - 8, kUIScreenWidth * 9/16 - 30 - 8 , 70, 30);
            }];
        }];
    }
}

- (CABasicAnimation *)rotation:(float)dur angle:(float)angle z:(int)z repeatCount:(int)repeatCount //旋转
{
    CATransform3D rotationTransform  = CATransform3DMakeRotation(angle, 0, 0, z);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"rotation"];
    
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration= dur;
    animation.autoreverses= NO;
    animation.cumulative= YES;
    animation.removedOnCompletion= YES;
    animation.fillMode=kCAFillModeForwards;
    animation.repeatCount= repeatCount;
//    animation.delegate= self;
    
    return animation;
}

- (BOOL)shouldAutorotate{
    //是否允许转屏
    return YES;
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


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    //viewController所支持的全部旋转方向
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    //viewController初始显示的方向
    return UIInterfaceOrientationPortrait;
}




@end
