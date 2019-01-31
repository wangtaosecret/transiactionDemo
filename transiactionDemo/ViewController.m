//
//  ViewController.m
//  transiactionDemo
//
//  Created by wangtao on 2017/11/14.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "FlipPresentAnimationController.h"
#import "FlipDismissAnimationController.h"
#import "PresentDismisTransicatonManager.h"
#import "PresentInterationController.h"
@interface ViewController ()<UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UIButton *blackButton;
@property (nonatomic, strong) CAShapeLayer *blueLayer;
@property (nonatomic, assign) BOOL interactionInProgress;
@end

@implementation ViewController
{
	BOOL _shouldCompleteTransition;
	DetailViewController *d;
//	PresentInterationController *_presentInteration;
    PresentDismisTransicatonManager<UIViewControllerTransitioningDelegate> *manager;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	
	d = [DetailViewController new];

	
	
	manager = [[PresentDismisTransicatonManager alloc] initWithCurrentViewController:self disablePresentInteraction:YES originalView:nil convertOriginalViewView:nil presentType:PresentAnimationControllerTypeIncreaseSize presentedViewController:d disableDownGesture:YES];

    d.transitioningDelegate = manager;

}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	
}
- (IBAction)click:(id)sender {
	[self presentViewController:d animated:YES completion:NULL];
}
@end
