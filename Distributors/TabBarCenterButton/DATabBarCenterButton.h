//
//  DATabBarCenterButton.h
//  CustomTabBar
//
//  Created by Tao Yunfei on 9/18/15.
//  Copyright (c) 2015 Walt Disney Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DATabBarCenterButton : UIView


- (instancetype)initWithFrame:(CGRect)frame tabBarController:(UITabBarController *)tabBarController;

- (NSInteger)index;

- (void)setNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;

- (void)removeContentView;

@property (nonatomic, assign) BOOL selected;




@end
