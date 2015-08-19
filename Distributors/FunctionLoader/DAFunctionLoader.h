//
//  DAViewControllerLoader.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGViewController.h"

@class AGViewController;
@interface DAFunctionLoader : UINavigationController

+ (instancetype)instance;

- (void)setViewController:(AGViewController *)viewController;

@end
