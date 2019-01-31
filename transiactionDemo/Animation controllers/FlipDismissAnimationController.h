//
//  FlipDismissAnimationController.h
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^dismisedBlock)(void);
@class SwipeInteractionController;
@interface FlipDismissAnimationController : NSObject<UIViewControllerAnimatedTransitioning>
- (instancetype)initWithDestinationFrame:(CGRect)destinationFrame interactionController:(SwipeInteractionController *)viewController;
- (instancetype)initWithDestinationView:(UIView *)destinationView interactionController:(SwipeInteractionController *)viewController;
- (instancetype)initWithDestinationView:(UIView *)destinationView interactionController:(SwipeInteractionController *)viewController dismisedBlock:(dismisedBlock)dismisedBlock;
@property (nonatomic, strong) SwipeInteractionController *interactionViewController;
@end
