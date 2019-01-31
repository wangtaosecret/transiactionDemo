//
//  PresentDismisTransicatonManager.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/18.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "PresentDismisTransicatonManager.h"
#import "SwipeInteractionController.h"
@interface PresentDismisTransicatonManager()
@property (nonatomic, copy) swipeWithDirectionBlock swipeBlock;
@end
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
- (void)setSwipeBlock:(swipeWithDirectionBlock)swipeBlock{
    _swipeBlock = swipeBlock;
}
- (instancetype)initWithCurrentViewController:(UIViewController *)currentVC
					disablePresentInteraction:(BOOL)disable
								 originalView:(UIView *)originalView
					  convertOriginalViewView:(UIView *)convertView
								  presentType:(PresentAnimationControllerType)presentType
					  presentedViewController:(UIViewController *)presentedViewController
						   disableDownGesture:(BOOL)disableDownGesture{
	
	_disablePresentInteraction = disable;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismisCurrentVC:) name:PresentDismisTransicatonManagerDimsmisCurrentVC object:nil];
    
	PresentInterationController *presentInteration = [[PresentInterationController alloc] initWithViewController:currentVC presentedViewController:presentedViewController disablePresentInteraction:disable];
	
	_swipeInteractionController = [[SwipeInteractionController alloc] initWithViewController:presentedViewController disableDownGesture:disableDownGesture];
	__weak __typeof(self) weakSelf = self;
	_swipeInteractionController.swipeWithDirectionBlock = ^(UIPanGestureRecognizerDirection currentDirection) {
		if (weakSelf.swipeBlock) weakSelf.swipeBlock(currentDirection);
	};
	
	FlipPresentAnimationController *presentAnimation = [[FlipPresentAnimationController alloc]
														initWithOriginalView:originalView convertView:convertView
														interactionController:presentInteration
														withType:presentType];
	
	FlipDismissAnimationController *dismisAnimation = [[FlipDismissAnimationController alloc]
													   initWithDestinationView:originalView convertFrameView:convertView
													   interactionController:_swipeInteractionController];
	
	PresentInterationController<UIViewControllerInteractiveTransitioning> *presentInteractionController = (id<UIViewControllerInteractiveTransitioning>)presentAnimation.interactionViewController;
	
	SwipeInteractionController<UIViewControllerInteractiveTransitioning> *dismisInteractionController = (id<UIViewControllerInteractiveTransitioning>)_swipeInteractionController;
	
	return [self initWithPresentAnimation:presentAnimation dismisAnimation:dismisAnimation presentInteractionController:presentInteractionController dismisInteractionController:dismisInteractionController];
}
- (void)dismisCurrentVC:(NSNotification *)notify{
//    UIViewController *vc = (UIViewController *)notify.object;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (instancetype)initWithCurrentViewController:(UIViewController *)currentVC disablePresentInteraction:(BOOL)disable originalView:(UIView *)originalView convertOriginalViewView:(UIView *)convertView presentType:(PresentAnimationControllerType)presentType presentedViewController:(UIViewController *)presentedViewController disableDownGesture:(BOOL)disableDownGesture swipeBlock:(swipeWithDirectionBlock)swipeBlock{
    _swipeBlock = swipeBlock;
    return [self initWithCurrentViewController:currentVC disablePresentInteraction:disable originalView:originalView convertOriginalViewView:convertView presentType:presentType presentedViewController:presentedViewController disableDownGesture:disableDownGesture];
}
- (instancetype)init{
    if (self == [super init]) {
        
    }
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
	return _presentAnimation;
}
#pragma mark 对于禁止手势进行present的情况，一定要返回nil，否则已知的情况是iOS10.3之前的版本会无法完成transaction，可能是之前iOS的bug
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
	
	if (_disablePresentInteraction) {
		return nil;
	}
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
