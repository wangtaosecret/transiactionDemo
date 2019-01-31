//
//  TestViewController.m
//  transiactionDemo
//
//  Created by wangtao on 2018/1/23.
//  Copyright © 2018年 dewmobile. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
	btn.center = self.view.center;
	[self.view addSubview:btn];
	[btn addTarget:self action:@selector(dismis) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
- (void)dismis{
	[self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)dealloc{
	NSLog(@"TestViewController dealloc");
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
