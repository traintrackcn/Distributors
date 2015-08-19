//
//  DAViewControllerLoader.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAFunctionLoader.h"

@interface DAFunctionLoader ()

@end

@implementation DAFunctionLoader

+ (instancetype)instance{
    DAFunctionLoader *instance = [[self.class alloc] init];
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    TLOG(@"self.navigationController -> %@", self.navigationController);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewController:(AGViewController *)viewController{
//    [self decorateViewController:viewController];
    [self removeViewControllers];
    [self pushViewController:viewController animated:NO];
}

//- (void)decorateViewController:(AGViewController *)viewController{
//    UINavigationItem *navigationItem = viewController.navigationItem;
//    if ([AGFeatureCoordinator singleton].isFixedNavigationBarLogoAvailable){
//        [navigationItem setTitleView:self.navigationBarTitleView];
//    }
//    [navigationItem setLeftBarButtonItem:self.menuBarItem];
//    //    TLOG(@"viewController.navigationItem -> %@", viewController.navigationItem);
//}

- (void)removeViewControllers{
    while (self.viewControllers.count > 0) {
        AGViewController *vc = self.viewControllers.firstObject;
        [vc viewWillDisappear:NO];  //dispatch viewWillDisappear
        [vc removeFromParentViewController];
    }
}

@end
