//
//  SwipeInteractionController.h
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureHelper.h"
@interface SwipeInteractionController : UIPercentDrivenInteractiveTransition<UIViewControllerInteractiveTransitioning>
@property (nonatomic, assign) BOOL interactionInProgress;	///进度动画的进度 0-1
- (instancetype)initWithViewController:(UIViewController *)viewController;
- (instancetype)initWithViewController:(UIViewController *)viewController presentedViewController:(UIViewController *)presentedViewController;
- (instancetype)initWithViewController:(UIViewController *)viewController disableDownGesture:(BOOL)disableDownGesture;
- (void)dismisCurrentViewController;
@property (nonatomic, copy) void (^didMoveBlock)(CGPoint translation);
//@property (nonatomic, copy) void (^swipeUpBlock)(void);
@property (nonatomic, copy) void (^swipeWithDirectionBlock)(UIPanGestureRecognizerDirection currentDirection);
@property (nonatomic, assign) UIPanGestureRecognizerDirection currentDirection; 	///当前手势的方向
@end
