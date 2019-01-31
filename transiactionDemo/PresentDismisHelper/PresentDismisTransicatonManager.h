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
#import "SwipeInteractionController.h"
///dismis当前控制器的通知
static NSString *const PresentDismisTransicatonManagerDimsmisCurrentVC = @"PresentDismisTransicatonManagerDimsmisCurrentVC";
typedef void (^swipeWithDirectionBlock)(UIPanGestureRecognizerDirection currentDirection);
@interface PresentDismisTransicatonManager : NSObject <UIViewControllerTransitioningDelegate>
@property (nonatomic, strong, readonly) SwipeInteractionController *swipeInteractionController;
@property (nonatomic, assign) BOOL disablePresentInteraction;
//- (instancetype)initWithPresentAnimation:(id<UIViewControllerAnimatedTransitioning>)presentAnimation
//						 dismisAnimation:(id<UIViewControllerAnimatedTransitioning>)dismisAnimation
//			presentInteractionController:(id<UIViewControllerInteractiveTransitioning>)presentInteractive
//			 dismisInteractionController:(id<UIViewControllerInteractiveTransitioning>)dismisInteractive;

/**
 创建present dismiss manager

 @param currentVC 当前所在的控制器 非空
 @param disable 是否禁止在当前控制器使用手势来展示要present的控制器 默认NO
 @param originalView 点击的视图
 @param convertView 点击视图获取正确frame所在的view
 @param presentType 展示的类型 PresentAnimationControllerType
 @param presentedViewController 需要展示的控制器
 @param disableDownGesture 是否在present之后禁止下滑手势返回（dismiss）
 @return instance
 */
- (instancetype)initWithCurrentViewController:(UIViewController *)currentVC
					disablePresentInteraction:(BOOL)disable
								 originalView:(UIView *)originalView
					  convertOriginalViewView:(UIView *)convertView
								  presentType:(PresentAnimationControllerType)presentType
					  presentedViewController:(UIViewController *)presentedViewController
						   disableDownGesture:(BOOL)disableDownGesture;

- (instancetype)initWithCurrentViewController:(UIViewController *)currentVC
                    disablePresentInteraction:(BOOL)disable
                                 originalView:(UIView *)originalView
                      convertOriginalViewView:(UIView *)convertView
                                  presentType:(PresentAnimationControllerType)presentType
                      presentedViewController:(UIViewController *)presentedViewController
                           disableDownGesture:(BOOL)disableDownGesture swipeBlock:(swipeWithDirectionBlock)swipeBlock;

//- (instancetype)initWithCurrentViewController:(UIViewController *)currentVC
//					disablePresentInteraction:(BOOL)disable
//								 originalView:(UIView *)originalView
//					  convertOriginalViewView:(UIView *)convertView
//								  presentType:(PresentAnimationControllerType)presentType
//					  presentedViewController:(UIViewController *)presentedViewController;
@end
