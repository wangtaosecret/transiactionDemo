//
//  PresentInterationController.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/17.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "PresentInterationController.h"
#import "GestureHelper.h"
@interface PresentInterationController()<UIGestureRecognizerDelegate>
@property (nonatomic, weak) UIViewController *fromViewController;
@property (nonatomic, weak) UIViewController *toViewController;
@end
@implementation PresentInterationController
{
	BOOL _shouldCompleteTransition;
	BOOL _disablePresentInteraction;
	CGPoint oldTranslation;
}
- (instancetype)initWithViewController:(UIViewController *)viewController{
	if (self == [super init]) {
		_fromViewController = viewController;
		
		[self prepareGestureRecognizer: viewController.view];
	}
	return self;
}
- (instancetype)initWithViewController:(UIViewController *)viewController presentedViewController:(UIViewController *)presentedViewController{
	_toViewController = presentedViewController;
	return [self initWithViewController:viewController];
}
- (instancetype)initWithViewController:(UIViewController *)viewController presentedViewController:(UIViewController *)presentedViewController disablePresentInteraction:(BOOL)disable{
	_disablePresentInteraction = disable;
	return [self initWithViewController:viewController presentedViewController:presentedViewController];
}
- (void)prepareGestureRecognizer:(UIView *)view{
	UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
	gesture.delegate = self;
	[view addGestureRecognizer:gesture];
	
}
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
	if ([panGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
		
		return [GestureHelper isLeftGesture:panGestureRecognizer inView:_fromViewController.view] && !_disablePresentInteraction;
	}
	return YES;
	
}
- (void)handleGesture:(UIPanGestureRecognizer *)gesture{
	CGPoint point = [gesture translationInView:gesture.view];
	
	float progress = 0;

	progress = -point.x / 300;
	
	progress = (CGFloat)(fminf(fmaxf(progress, 0.0), 1.0));
	
	switch (gesture.state) {
		case UIGestureRecognizerStateBegan:
			_interactionInProgress = YES;

			[_fromViewController presentViewController:_toViewController animated:YES completion:NULL];
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
@end
