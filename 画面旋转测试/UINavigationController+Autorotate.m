//
//  UINavigationController+Autorotate.m
//  画面旋转测试
//
//  Created by TianWan on 2017/1/5.
//  Copyright © 2017年 天玩. All rights reserved.
//

#import "UINavigationController+Autorotate.h"

@implementation UINavigationController (Autorotate)

- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

//- (BOOL)shouldAutorotate
//{
//    return [[self.viewControllers lastObject] shouldAutorotate];
//}
//
//
//- (NSUInteger)supportedInterfaceOrientations
//{
//    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
//}
//
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
//}

@end
