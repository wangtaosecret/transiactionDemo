//
//  FlipPresentAnimationController.m
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import "FlipPresentAnimationController.h"
#import "AnimationHelper.h"
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KSCREEE_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface FlipPresentAnimationController()
@property (nonatomic, strong) UIView *snapshot;
@property (strong, nonatomic) UIView *shadowView;
@end
@implementation FlipPresentAnimationController{
	 CGRect _originalFrame;
	 UIView *_destinationView;
	 PresentAnimationControllerType _type;
	 BOOL _disablePresentInteraction;
}
- (instancetype)initWithOriginalFrame:(CGRect)originalFrame{
	if (self == [super init]) {
		_originalFrame = originalFrame;
	}
	return self;
}
- (instancetype)initWithDestinationView:(UIView *)destinationView{
	_destinationView = destinationView;
	return [self initWithOriginalFrame:destinationView.frame];
}
- (instancetype)initWithOriginalView:(UIView *)destinationView interactionController:(PresentInterationController *)viewController{
	 _interactionViewController = viewController;
	 _destinationView = destinationView;
	 return [self initWithOriginalFrame:destinationView.frame];
}
- (instancetype)initWithOriginalView:(UIView *)destinationView interactionController:(PresentInterationController *)viewController withType:(PresentAnimationControllerType)type{
	 _type = type;
	 return [self initWithOriginalView:destinationView interactionController:viewController];
}
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext { 
	UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
	UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
	
	UIView *containerView = transitionContext.containerView;
	CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
	NSTimeInterval dur = [self transitionDuration:transitionContext];
	
	 if (_type == PresentAnimationControllerTypeDefaultPush) {
		  self.shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT)];
		  
		  self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6f];
		  
		  [toVC.view addSubview:self.shadowView];
		  
		  toVC.view.frame = CGRectMake(KSCREEN_WIDTH, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
		  
		  [containerView addSubview:toVC.view];
		  
		  //添加阴影
		  toVC.view.layer.shadowColor = [[UIColor blackColor] CGColor];
		  
		  toVC.view.layer.shadowOpacity = 0.6;
		  
		  toVC.view.layer.shadowRadius = 8;
		  
		  [UIView animateWithDuration:dur
						   animations:^{
								
								self.shadowView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
								fromVC.view.frame = CGRectMake(-KSCREEN_WIDTH * 2 / 5, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
								toVC.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
						   } completion:^(BOOL finished) {
								
								[self.shadowView removeFromSuperview];
								fromVC.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
								toVC.view.frame = CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEE_HEIGHT);
								[transitionContext completeTransition:![transitionContext transitionWasCancelled]];
								
						   }];
	 }else if(_type == PresentAnimationControllerTypeIncreaseSize){
//		  UIView *snapshot = [toVC.view snapshotViewAfterScreenUpdates:YES];
		  UIView *snapshot = [_destinationView snapshotViewAfterScreenUpdates:YES];
		  snapshot.frame = _originalFrame;
		  snapshot.layer.masksToBounds = YES;
		  [containerView addSubview:toVC.view];
		  [containerView addSubview:snapshot];
		  
		  toVC.view.hidden = YES;
		  [UIView animateKeyframesWithDuration:dur
										 delay:0.0
									   options:UIViewKeyframeAnimationOptionCalculationModeCubic
									animations:^{
											  snapshot.frame = finalFrame;
									} completion:^(BOOL finished) {
										 toVC.view.hidden = NO;
										 //
										 [snapshot removeFromSuperview];
										 [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
									}];
	 }
	 
	
	
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext { 
	return 0.4;
}

@end
