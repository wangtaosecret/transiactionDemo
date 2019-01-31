//
//  FlipDismissAnimationController.m
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import "FlipDismissAnimationController.h"
#import "AnimationHelper.h"
#import "SwipeInteractionController.h"
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KSCREEE_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface FlipDismissAnimationController()
@property (nonatomic, strong) UIView *snapshot;
@property (strong, nonatomic) UIView *shadowView;
@end
@implementation FlipDismissAnimationController{
	CGRect _destinationFrame;
	UIView *_destinationView;
	UIView *_convertFrameView;
}
- (instancetype)initWithDestinationFrame:(CGRect)destinationFrame interactionController:(SwipeInteractionController *)viewController{
	if (self == [super init]) {
		_destinationFrame = destinationFrame;
		_interactionViewController = viewController;
		__weak typeof(FlipDismissAnimationController) *weakself = self;
		_interactionViewController.didMoveBlock = ^(CGPoint translation) {
			weakself.snapshot.frame = ({
				CGRect frame = weakself.snapshot.frame;
				frame.origin.x += translation.x;
				frame.origin.y += translation.y;
				frame;
			});
		};
	}
	return self;
}
- (instancetype)initWithDestinationView:(UIView *)destinationView interactionController:(SwipeInteractionController *)viewController{
	if (self == [super init]) {
		_destinationView = destinationView;
		_destinationFrame = [destinationView convertRect:destinationView.bounds toView:_convertFrameView];
		_interactionViewController = viewController;
		__weak typeof(FlipDismissAnimationController) *weakself = self;
		_interactionViewController.didMoveBlock = ^(CGPoint translation) {
		
			weakself.snapshot.frame = ({
				CGRect frame = weakself.snapshot.frame;
				frame.origin.x += translation.x;
				frame.origin.y += translation.y;
				frame;
			});
		};
	}
	return self;
}
- (instancetype)initWithDestinationView:(UIView *)destinationView convertFrameView:(UIView *)convertFrameView interactionController:(SwipeInteractionController *)viewController{
	_convertFrameView = convertFrameView;
	return [self initWithDestinationView:destinationView interactionController:viewController];
}
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
	
	CGFloat dur = [self transitionDuration:transitionContext];
    UIView *containerView = [transitionContext containerView];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	if (_interactionViewController.currentDirection == UIPanGestureRecognizerDirectionDown) {
		
		self.snapshot = [fromViewController.view snapshotViewAfterScreenUpdates:YES];
		self.snapshot.layer.masksToBounds = true;
		[containerView insertSubview:toViewController.view atIndex:0];
		
		fromViewController.view.hidden = YES;
		_destinationView.hidden = YES;
		[containerView addSubview:self.snapshot];
		[UIView animateKeyframesWithDuration:dur
									   delay:0.0
									 options:UIViewKeyframeAnimationOptionCalculationModeCubic
								  animations:^{
									  
									  [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1 animations:^{
										  self.snapshot.alpha = 0.8f;
									  }];
								  } completion:^(BOOL finished) {
									  
									  
									  if (transitionContext.transitionWasCancelled) {
										  [UIView animateWithDuration:0.2 animations:^{
											  self.snapshot.frame = fromViewController.view.bounds;
										  } completion:^(BOOL finished) {
											  [toViewController.view removeFromSuperview];
											  fromViewController.view.hidden = NO;
											  _destinationView.hidden = NO;
											  [self.snapshot removeFromSuperview];
											  [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
										  }];
										  
										  
									  }else{
										  
										  
										  [UIView animateWithDuration:0.2 animations:^{
											  self.snapshot.frame = _destinationFrame;
										  } completion:^(BOOL finished) {
											  [self.snapshot removeFromSuperview];
											  _destinationView.hidden = NO;
											  fromViewController.view.hidden = NO;
											  [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
										  }];
										  
//										  [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//											  self.snapshot.frame = _destinationFrame;
//										  } completion:^(BOOL finished) {
//											  [self.snapshot removeFromSuperview];
//											  _destinationView.hidden = NO;
//                                              fromViewController.view.hidden = NO;
//											  [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//										  }];
										  
									  }
									  
								  }];
	}else if (_interactionViewController.currentDirection == UIPanGestureRecognizerDirectionRight){
		
		
		self.shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT)];
		
		self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6f];
		
		[toViewController.view addSubview:self.shadowView];
		
		toViewController.view.frame = CGRectMake(-KSCREEN_WIDTH * 2 / 5, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
		
		[containerView insertSubview:toViewController.view
						belowSubview:fromViewController.view];
		
		//添加阴影
		fromViewController.view.layer.shadowColor = [[UIColor blackColor] CGColor];
		
		fromViewController.view.layer.shadowOpacity = 0.6;
		
		fromViewController.view.layer.shadowRadius = 8;
		
		[UIView animateWithDuration:[self transitionDuration:transitionContext]
						 animations:^{
							 
							 self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
							 
							 fromViewController.view.frame = CGRectMake(KSCREEN_WIDTH, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
							 toViewController.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
//							 toViewContr0oller.view.transform = CGAffineTransformMakeScale(1, 1);
							 
						 } completion:^(BOOL finished) {
							 
//							 toViewController.view.transform = CGAffineTransformIdentity;
							 
							 [self.shadowView removeFromSuperview];
							 fromViewController.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
							 toViewController.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
							 [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
							 
						 }];
	
	}else if (_interactionViewController.currentDirection == UIPanGestureRecognizerDirectionLeft){
		CGFloat dur = [self transitionDuration:transitionContext];
		
		UIView *containerView = [transitionContext containerView];
		
		UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
		
		UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
		
		self.shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT)];
		
		self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6f];
		
		[fromViewController.view addSubview:self.shadowView];
		
		
		toViewController.view.frame = CGRectMake(KSCREEN_WIDTH, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
		
		[containerView addSubview:toViewController.view];
		
		//添加阴影
		toViewController.view.layer.shadowColor = [[UIColor blackColor] CGColor];
		
		toViewController.view.layer.shadowOpacity = 0.6;
		
		toViewController.view.layer.shadowRadius = 8;
		
		[UIView animateWithDuration:dur
						 animations:^{
							 
							 self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
							 fromViewController.view.frame = CGRectMake(- KSCREEN_WIDTH * 2 / 5, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
							 toViewController.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
						 } completion:^(BOOL finished) {
							 
							 [self.shadowView removeFromSuperview];
							 fromViewController.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
							 toViewController.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
							 [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
							 
						 }];
		
	}
	
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    if (_interactionViewController.currentDirection == UIPanGestureRecognizerDirectionDown) {
        return 0.2;
    }else if (_interactionViewController.currentDirection == UIPanGestureRecognizerDirectionRight || _interactionViewController.currentDirection == UIPanGestureRecognizerDirectionLeft){
       return 0.3;
    }
    return 0;
}

@end
