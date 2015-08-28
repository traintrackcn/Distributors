//
//  DAButton.h
//  Distributors
//
//  Created by Tao Yunfei on 8/28/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAButton : UIView


- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title iconName:(NSString *)iconName;

@property (nonatomic, assign) BOOL alignLeft;

@end
