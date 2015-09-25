//
//  DATaskTypePicker.h
//  Distributors
//
//  Created by Tao Yunfei on 9/25/15.
//  Copyright © 2015 AboveGEM. All rights reserved.
//

#import "AGViewController.h"

@class DAOpportunity;
@interface DATaskTypePicker : AGViewController

@property (nonatomic, strong) DAOpportunity *opptunity;
@property (nonatomic, strong) AGViewController *viewConrollerPresentedFrom;

@end
