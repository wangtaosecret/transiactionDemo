//
//  CustomNavViewController.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/23.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "CustomNavViewController.h"
#import "SwipeInteractionController.h"
@interface CustomNavViewController ()

@end

@implementation CustomNavViewController
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
	if (self == [super initWithRootViewController:rootViewController]) {
		_swipeInteractionController = [[SwipeInteractionController alloc] initWithViewController:self disableDownGesture:YES];

	}
//	[self.interactivePopGestureRecognizer setDelegate:nil];
	return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
