//
//  AnimationHelper.h
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AnimationHelper : NSObject
+ (CATransform3D)yRotation:(CGFloat)angle;
+ (void)perspectiveTransform:(UIView *)view;
@end
