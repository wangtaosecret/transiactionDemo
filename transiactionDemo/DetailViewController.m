//
//  DetailViewController.m
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import "DetailViewController.h"
#import "SwipeInteractionController.h"
#import "RightViewController.h"
#import "FlipPresentAnimationController.h"
#import "FlipDismissAnimationController.h"
#import "PresentInterationController.h"
#import "PresentDismisTransicatonManager.h"
#import "CustomNavViewController.h"
@interface DetailViewController ()<UIViewControllerTransitioningDelegate>
- (IBAction)dismis:(id)sender;


@end

@implementation DetailViewController{
	RightViewController *_right;
	PresentInterationController *_presentInteration;
	PresentDismisTransicatonManager<UIViewControllerTransitioningDelegate> *manager;
	CustomNavViewController *_nav;
}
- (instancetype)init{
	if (self == [super init]) {
		_right = [RightViewController new];
		
		
        _nav = [[CustomNavViewController alloc] initWithRootViewController:_right];
//
//        _presentInteration = [[PresentInterationController alloc] initWithViewController:self presentedViewController:_nav];
//        FlipPresentAnimationController *presentController =
//        [[FlipPresentAnimationController alloc] initWithOriginalView:self.blackButton interactionController:_presentInteration withType:PresentAnimationControllerTypeDefaultPush];
//        FlipDismissAnimationController *dismisController =
//        [[FlipDismissAnimationController alloc] initWithDestinationView:self.blackButton interactionController:_nav.swipeInteractionController];
//
//        SwipeInteractionController<UIViewControllerInteractiveTransitioning> *dismisInteractionController = (id<UIViewControllerInteractiveTransitioning>)_nav.swipeInteractionController;
//        PresentInterationController *presentInteractionController = presentController.interactionViewController;
		
		
//        manager = [[PresentDismisTransicatonManager alloc]
//                   initWithPresentAnimation:presentController
//                   dismisAnimation:dismisController
//                   presentInteractionController:presentInteractionController
//                   dismisInteractionController:dismisInteractionController];
        
        
        manager = [[PresentDismisTransicatonManager alloc] initWithCurrentViewController:self disablePresentInteraction:NO originalView:nil convertOriginalViewView:nil presentType:PresentAnimationControllerTypeDefaultPush presentedViewController:_nav disableDownGesture:YES];
		
		_nav.transitioningDelegate = manager;
	}
	return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismis:(id)sender {
	[self dismissViewControllerAnimated:YES completion:NULL];
}
@end
