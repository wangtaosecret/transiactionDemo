//
//  SwipeInteractionController.m
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import "SwipeInteractionController.h"
#import "GestureHelper.h"
@interface SwipeInteractionController()<UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIViewController *fromViewController;
@property (nonatomic, weak) UIViewController *toViewController;

@end
@implementation SwipeInteractionController{
	BOOL _shouldCompleteTransition;
	CGPoint oldTranslation;
	float progress;
    BOOL _disableDownGesture;
}
- (instancetype)initWithViewController:(UIViewController *)viewController{
	if (self == [super init]) {
		_fromViewController = viewController;
		
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *nav = (UINavigationController *)viewController;
            UIViewController *rootVC = nav.viewControllers[0];
            [self prepareGestureRecognizer: rootVC.view];
        }else{
        
            [self prepareGestureRecognizer: viewController.view];
        }
	}
	return self;
}
- (instancetype)initWithViewController:(UIViewController *)viewController presentedViewController:(UIViewController *)presentedViewController{
	_toViewController = presentedViewController;
	return [self initWithViewController:viewController];
}
- (instancetype)initWithViewController:(UIViewController *)viewController disableDownGesture:(BOOL)disableDownGesture{
    _disableDownGesture = disableDownGesture;
    return [self initWithViewController:viewController];
}
- (void)prepareGestureRecognizer:(UIView *)view{
	UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
	gesture.delegate = self;
	[view addGestureRecognizer:gesture];
	
	UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp)];
	swipe.direction = UISwipeGestureRecognizerDirectionUp;
	[view addGestureRecognizer:swipe];
}
- (void)swipeUp{
	if (_swipeUpBlock) _swipeUpBlock();
}
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
	if ([panGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
		
		if ( [GestureHelper isDownGesture:panGestureRecognizer inView:_fromViewController.view]) {
			_currentDirection = UIPanGestureRecognizerDirectionDown;
		}else if([GestureHelper isRightGesture:panGestureRecognizer inView:_fromViewController.view]){
			_currentDirection = UIPanGestureRecognizerDirectionRight;
		}
		return ([GestureHelper isDownGesture:panGestureRecognizer inView:_fromViewController.view] && !_disableDownGesture)
			|| [GestureHelper isRightGesture:panGestureRecognizer inView:_fromViewController.view] ;
	}
	return YES;
	
}
- (void)handleGesture:(UIPanGestureRecognizer *)gesture{
	
	CGPoint point = [gesture translationInView:gesture.view];
	
	CGPoint translation = [gesture translationInView:gesture.view.superview];
	
	
	if (_currentDirection == UIPanGestureRecognizerDirectionRight || _currentDirection == UIPanGestureRecognizerDirectionDown) {
		if (_currentDirection == UIPanGestureRecognizerDirectionRight) {
			
			progress = point.x / 300;
		}else if (_currentDirection == UIPanGestureRecognizerDirectionDown){
			
			progress = translation.y / 300;
			
			if ((point.x != oldTranslation.x || point.y != oldTranslation.y)) {
				if (_didMoveBlock) _didMoveBlock(CGPointMake(point.x - oldTranslation.x, point.y - oldTranslation.y));
				oldTranslation = point;
			}
		}
		progress = (CGFloat)(fminf(fmaxf(progress, 0.0), 1.0));
		
		switch (gesture.state) {
			case UIGestureRecognizerStateBegan:
				_interactionInProgress = YES;
				[_fromViewController dismissViewControllerAnimated:YES completion:nil];
				break;
			case UIGestureRecognizerStateChanged:
				_shouldCompleteTransition = progress > 0.5;
				[self updateInteractiveTransition:progress];
				break;
			case UIGestureRecognizerStateCancelled:
				_interactionInProgress = false;
				[self cancelInteractiveTransition];
				break;
			case UIGestureRecognizerStateEnded:
				_interactionInProgress = NO;
				if (_shouldCompleteTransition) {
					[self finishInteractiveTransition];
				}else{
					[self cancelInteractiveTransition];
				}
				break;
			default:
				break;
		}
	}

	
}
@end
