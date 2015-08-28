//
//  DAToolboxUnit.h
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"
#import <UIKit/UIKit.h>

@interface DAToolboxItem : AGModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *iconName;

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightColor;

@end
