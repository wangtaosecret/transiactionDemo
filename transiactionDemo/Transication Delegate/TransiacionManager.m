//
//  TransiacionManager.m
//  transiactionDemo
//
//  Created by wangtao on 2017/11/15.
//  Copyright © 2017年 dewmobile. All rights reserved.
//

#import "TransiacionManager.h"

@implementation TransiacionManager
+ (instancetype)sharedManager{
	static TransiacionManager *_sharedManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedManager = [[self alloc] init];
	});
	return _sharedManager;
}
@end
