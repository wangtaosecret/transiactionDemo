//
//  PercentDrivenInteractivePresentAnimationController.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/19.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "PercentDrivenInteractivePresentAnimationController.h"
#define KSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define KSCREEE_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface PercentDrivenInteractivePresentAnimationController()
@property (nonatomic, strong) UIView *snapshot;
@property (strong, nonatomic) UIView *shadowView;
@end
@implementation PercentDrivenInteractivePresentAnimationController
{
	CGRect _originalFrame;
	CAShapeLayer *_layer;
	UIView *_destinationView;
}
- (instancetype)initWithOriginalFrame:(CGRect)originalFrame{
	if (self == [super init]) {
		_originalFrame = originalFrame;
	}
	return self;
}
- (instancetype)initWithOriginalView:(UIView *)destinationView interactionController:(PresentInterationController *)viewController{
	_interactionViewController = viewController;
	return [self initWithOriginalFrame:destinationView.frame];
}
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
	
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

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
	return 0.4;
}

@end
