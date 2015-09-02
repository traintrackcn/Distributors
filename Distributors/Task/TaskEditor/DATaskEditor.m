//
//  DAOpportunityTaskEditor.m
//  Distributors
//
//  Created by Tao Yunfei on 8/24/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskEditor.h"
#import "DATextDefine.h"
#import "DATask.h"
#import "GlobalDefine.h"
#import "DAOpportunity.h"
#import "DAOpportunityDataset.h"


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


#pragma mark - interactive ops

- (void)didTapSave:(id)sender{
    
    //demo ops
    TLOG(@"self.opportunity -> %@", self.opportunity);
    [self.opportunity setTasks:@[[DAOpportunityDataset singleton].demoTasksOngoing.firstObject ]];
    
    
    [self.previousViewController setFlagDoReload:YES];
    [super didTapSave:sender];
}

#pragma mark -

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
