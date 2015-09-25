//
//  DATaskTypeItem.h
//  Distributors
//
//  Created by Tao Yunfei on 9/25/15.
//  Copyright © 2015 AboveGEM. All rights reserved.
//

#import "AGModel.h"
#import <UIKit/UIKit.h>

@interface DATaskTypeItem : AGModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong) Class editorCls;

@end
