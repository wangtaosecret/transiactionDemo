//
//  PercentDrivenInteractivePresentAnimationController.h
//  transiactionDemo
//
//  Created by wangtao on 2018/1/19.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class PresentInterationController;
@interface PercentDrivenInteractivePresentAnimationController : NSObject<UIViewControllerAnimatedTransitioning>
- (instancetype)initWithOriginalView:(UIView *)destinationView interactionController:(PresentInterationController *)viewController;
@property (nonatomic, strong) PresentInterationController *interactionViewController;
@end
