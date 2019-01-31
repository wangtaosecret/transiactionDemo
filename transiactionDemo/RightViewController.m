//
//  RightViewController.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/19.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "RightViewController.h"
#import "SwipeInteractionController.h"
#import "TestViewController.h"
@interface RightViewController ()

@end

@implementation RightViewController
- (instancetype)init{
	if (self == [super init]) {
		_swipeInteractionController = [[SwipeInteractionController alloc] initWithViewController:self disableDownGesture:YES];
//        _swipeInteractionController.swipeUpBlock = ^{
//            NSLog(@"向上滑动了");
//        };
	}
	return self;
}
- (IBAction)push:(id)sender {
	TestViewController *t = [TestViewController new];
	t.view.backgroundColor = [UIColor whiteColor];
	[self.navigationController pushViewController:t animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
