//
//  FlipPresentAnimationController.h
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PresentAnimationControllerType) {
	PresentAnimationControllerTypeDefaultPush, ///默认的push
	PresentAnimationControllerTypeIncreaseSize	///从小变大

};

@class PresentInterationController;
@interface FlipPresentAnimationController : NSObject <UIViewControllerAnimatedTransitioning>
- (instancetype)initWithDestinationView:(UIView *)destinationView;
- (instancetype)initWithOriginalView:(UIView *)destinationView interactionController:(PresentInterationController *)viewController;
- (instancetype)initWithOriginalView:(UIView *)destinationView interactionController:(PresentInterationController *)viewController withType:(PresentAnimationControllerType)type;
- (instancetype)initWithOriginalView:(UIView *)destinationView convertView:(UIView *)convertFrameView interactionController:(PresentInterationController *)viewController withType:(PresentAnimationControllerType)type;
@property (nonatomic, strong) PresentInterationController *interactionViewController;
@end
