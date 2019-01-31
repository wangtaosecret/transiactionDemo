//
//  GestureHelper.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/19.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "GestureHelper.h"

@implementation GestureHelper
+ (BOOL)isVerticalGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view{
	CGPoint velocity = [panGestureRecognizer velocityInView:view];
	return fabs(velocity.y) > fabs(velocity.x);
}
+ (BOOL)isDownGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view{
	CGPoint velocity = [panGestureRecognizer velocityInView:view];
	return (fabs(velocity.y) > fabs(velocity.x) && velocity.y > 0);
}
+ (BOOL)isRightGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view{
	CGPoint velocity = [panGestureRecognizer velocityInView:view];
	return (fabs(velocity.x) > fabs(velocity.y)) && velocity.x > 0;
}
+ (BOOL)isLeftGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view{
	CGPoint velocity = [panGestureRecognizer velocityInView:view];
	return (fabs(velocity.x) > fabs(velocity.y)) && velocity.x < 0;
}
@end
