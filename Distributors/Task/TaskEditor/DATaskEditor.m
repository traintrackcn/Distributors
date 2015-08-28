//
//  DAOpportunityTaskEditor.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskEditor.h"
#import "DATextDefine.h"
#import "AGTextCoordinator.h"
#import "AGTextfieldBoxCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAStyleDefine.h"
#import "DATask.h"
#import "DAStep.h"
#import "GlobalDefine.h"
#import "DSDeviceUtil.h"
#import "AGTextfieldCellStyleOptions.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "DATaskTypeCell.h"



@interface DATaskEditor(){
    
}


@end

@implementation DATaskEditor

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:[AGTextCoordinator textForKey:KEY_LBL_TASK_EDITOR]];
        
        
        
    }
    return self;
}


- (BOOL)isSectionReportAvailable{
    return NO;
}

- (BOOL)isLogBookAvailable{
    return NO;
}

- (BOOL)isSectionButtonAvailable{
    return YES;
}

- (BOOL)isEditorAvailable{
    return YES;
}


- (BOOL)isSectionDefineAvailable{
    return YES;
}

- (BOOL)isSectionTimeRequiredAvailable{
    return YES;
}

- (BOOL)isSectionRepeatAvailable{
    return YES;
}

- (BOOL)isSectionNotificationAvailable{
    return YES;
}

@end
