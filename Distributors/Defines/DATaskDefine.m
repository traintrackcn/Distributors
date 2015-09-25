//
//  DATaskComponentDefineDataset.m
//  Distributors
//
//  Created by Tao Yunfei on 8/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskDefine.h"
#import "DATextDefine.h"
#import "DATaskTypeItem.h"
#import "DSImage.h"
#import "DAStyleDefine.h"

@interface DATaskDefine(){
    
}

@property (nonatomic, strong) NSArray *taskDefineSectionClsNames;
@property (nonatomic, strong) NSArray *taskEditorClsNames;
@property (nonatomic, strong) NSArray *taskIconImages;

@end

@implementation DATaskDefine


- (NSString *)textForTaskType:(DATaskType)type{
    @try {
        return [self.taskTexts objectAtIndex:type];
    }@catch (NSException *exception) {}
    
    return [AGTextCoordinator textForKey:KEY_MSG_UNDEFINED];
}

- (Class)taskDefineSectionClsForTaskType:(DATaskType)type{
    NSString *str = [self.taskDefineSectionClsNames objectAtIndex:type];
    return NSClassFromString(str);
}

- (Class)taskEditorClsForTaskType:(DATaskType)type{
    NSString *str = [self.taskEditorClsNames objectAtIndex:type];
    return NSClassFromString(str);
}

- (UIImage *)iconImageForTaskType:(DATaskType)type{
    return [self.taskIconImages objectAtIndex:type];
}

#pragma mark - properties

- (NSArray *)taskTypeItems{
    if (!_taskTypeItems) {
        NSMutableArray *tmpArr = [NSMutableArray array];
        
        for (NSInteger i = 0; i < self.taskTexts.count; i++) {
            DATaskTypeItem *item = [DATaskTypeItem instance];
            UIImage *iconImg = [self iconImageForTaskType:i];
            NSString *title = [self textForTaskType:i];
            Class editorCls = [self taskEditorClsForTaskType:i];
            iconImg = [DSImage image:iconImg withMaskColor:STYLE_THEME_COLOR_2];
            [item setIconImage:iconImg];
            [item setTitle:title];
            [item setEditorCls:editorCls];
            [tmpArr addObject:item];
        }
        
        _taskTypeItems = tmpArr;
    }
    return _taskTypeItems;
}

- (NSArray *)taskIconImages{
    if (!_taskIconImages) {
        _taskIconImages = @[
                            [UIImage imageNamed:@"IconTaskTestimonial"],
                            [UIImage imageNamed:@"IconTaskEvents"],
                            [UIImage imageNamed:@"IconTaskProducts"],
                            [UIImage imageNamed:@"IconTaskAutoship"],
                            [UIImage imageNamed:@"IconTaskContacts"],
                            [UIImage imageNamed:@"IconTaskTraining"],
                            [UIImage imageNamed:@"IconTaskOthers"]
                            ];
    }
    return _taskIconImages;
}

- (NSArray *)taskTexts{
    if (!_taskTexts) {
        _taskTexts = @[
                       [AGTextCoordinator textForKey:KEY_LBL_TESTIMONIAL],
                       [AGTextCoordinator textForKey:KEY_LBL_EVENTS],
                       [AGTextCoordinator textForKey:KEY_LBL_PRODUCTS],
                       [AGTextCoordinator textForKey:KEY_LBL_AUTOSHIP],
                       [AGTextCoordinator textForKey:KEY_LBL_CONTACTS],
                       [AGTextCoordinator textForKey:KEY_LBL_TRAINING],
                       [AGTextCoordinator textForKey:KEY_LBL_OTHERS],
                       ];
    }
    return _taskTexts;
}

- (NSArray *)taskDefineSectionClsNames{
    if (!_taskDefineSectionClsNames) {
        _taskDefineSectionClsNames = @[
                                       @"DATestimonialTaskDefineSection",
                                       @"DAEventsTaskDefineSection",
                                       @"DAProductsTaskDefineSection",
                                       @"DAAutoshipTaskDefineSection",
                                       @"DAContactsTaskDefineSection",
                                       @"DATrainingTaskDefineSection",
                                       @"DAOthersTaskDefineSection",
                                       
                                       ];
    }
    return _taskDefineSectionClsNames;
}


- (NSArray *)taskEditorClsNames{
    if (!_taskEditorClsNames) {
        _taskEditorClsNames = @[
                                @"DATestimonialTaskEditor",
                                @"DAEventsTaskEditor",
                                @"DAProductsTaskEditor",
                                @"DAAutoshipTaskEditor",
                                @"DAContactsTaskEditor",
                                @"DATrainingTaskEditor",
                                @"DAOthersTaskEditor",
                                ];
    }
    return _taskEditorClsNames;
}

@end
