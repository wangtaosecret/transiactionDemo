//
//  GestureHelper.h
//  transiactionDemo
//
//  Created by wangtao on 2018/1/19.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GestureHelper : NSObject
+ (BOOL)isVerticalGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view;
+ (BOOL)isDownGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view;
+ (BOOL)isRightGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view;
+ (BOOL)isLeftGesture:(UIPanGestureRecognizer *)panGestureRecognizer inView:(UIView *)view;
@end
