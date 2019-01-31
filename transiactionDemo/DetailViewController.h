//
//  DetailViewController.h
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SwipeInteractionController;
@interface DetailViewController : UIViewController
@property (nonatomic, strong) SwipeInteractionController *swipeInteractionController;
@property (weak, nonatomic) IBOutlet UIView *blackButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
