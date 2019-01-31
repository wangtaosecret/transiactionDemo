//
//  AnimationHelper.m
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import "AnimationHelper.h"

@implementation AnimationHelper
+ (CATransform3D)yRotation:(CGFloat)angle{
	return CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
}
+ (void)perspectiveTransform:(UIView *)view{
	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = -0.002;
	view.layer.sublayerTransform = transform;
}
@end
