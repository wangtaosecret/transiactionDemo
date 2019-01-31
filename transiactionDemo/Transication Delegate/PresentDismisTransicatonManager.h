//
//  PresentDismisTransicatonManager.h
//  transiactionDemo
//
//  Created by wangtao on 2018/1/18.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FlipPresentAnimationController.h"
#import "FlipDismissAnimationController.h"
#import "PresentDismisTransicatonManager.h"
#import "PresentInterationController.h"
@interface PresentDismisTransicatonManager : NSObject <UIViewControllerTransitioningDelegate>
- (instancetype)initWithPresentAnimation:(id<UIViewControllerAnimatedTransitioning>)presentAnimation
						 dismisAnimation:(id<UIViewControllerAnimatedTransitioning>)dismisAnimation
			presentInteractionController:(id<UIViewControllerInteractiveTransitioning>)presentInteractive
			 dismisInteractionController:(id<UIViewControllerInteractiveTransitioning>)dismisInteractive;
@end
