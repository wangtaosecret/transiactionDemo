//
//  PresentInterationController.h
//  transiactionDemo
//
//  Created by wangtao on 2018/1/17.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureHelper.h"
@interface PresentInterationController : UIPercentDrivenInteractiveTransition<UIViewControllerInteractiveTransitioning>
@property (nonatomic, assign) BOOL interactionInProgress;
- (instancetype)initWithViewController:(UIViewController *)viewController presentedViewController:(UIViewController *)presentedViewController;
- (instancetype)initWithViewController:(UIViewController *)viewController presentedViewController:(UIViewController *)presentedViewController disablePresentInteraction:(BOOL)disable;
@end
