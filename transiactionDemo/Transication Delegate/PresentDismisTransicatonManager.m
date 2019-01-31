//
//  PresentDismisTransicatonManager.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/18.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "PresentDismisTransicatonManager.h"
@implementation PresentDismisTransicatonManager{
	id<UIViewControllerAnimatedTransitioning> _presentAnimation;
	id<UIViewControllerAnimatedTransitioning> _dismisAnimation;
	id<UIViewControllerInteractiveTransitioning> _presentInteraction;
	id<UIViewControllerInteractiveTransitioning> _dismisInteraction;
	
}
- (instancetype)initWithPresentAnimation:(id<UIViewControllerAnimatedTransitioning>)presentAnimation
						 dismisAnimation:(id<UIViewControllerAnimatedTransitioning>)dismisAnimation
			presentInteractionController:(id<UIViewControllerInteractiveTransitioning>)presentInteractive
			 dismisInteractionController:(id<UIViewControllerInteractiveTransitioning>)dismisInteractive{
	if (self == [super init]) {
		_presentAnimation = presentAnimation;
		_dismisAnimation = dismisAnimation;
		_presentInteraction = presentInteractive;
		_dismisInteraction = dismisInteractive;
	}
	return self;
}
- (instancetype)init{
    if (self == [super init]) {
        
    }
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
	return _presentAnimation;
}
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    
    return _presentInteraction;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
	return _dismisAnimation;
}
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{

	return _dismisInteraction;
//	FlipDismissAnimationController *ani = (FlipDismissAnimationController *)animator;
//	SwipeInteractionController *interactionController = ani.interactionViewController;
//	return (id<UIViewControllerInteractiveTransitioning>)interactionController;
}
@end
