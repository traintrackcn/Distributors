//
//  DATaskComponentDefineDataset.h
//  Distributors
//
//  Created by Tao Yunfei on 8/31/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADataset.h"
#import <UIKit/UIKit.h>


//0. Icon (define task icon)
//0. Name (define task name)
//1. Documents (e.g. pdf)
//2. Time required  (e.g 48 hours)
//3. Reminder (e.g every day at 8:00am)
//4. Repeat & End ( 不清楚 )
//5. Notify When Complete
//6. Text Notes
//7. Voice Notes
//8. Location
//9. Due time ( 不清楚 )
//10. Pictures
//11. Videos
//12. Links (Web Urls)
//13. Autoship Section ( multiple 19 )
//14. Products Section ( multiple 18 )
//15. Events Section ( multiple sub-tasks )
//16. Training Section ( 17, 12,  1)
//17. Target - BUY/SELL xx Products
//18. Target - BUY xx Products every xx Date
//19. Target - CREATE|APPROACH/ENROLL contacts


//TC = Task Component
#define DA_TC_ICON @"DA_TC_ICON"
#define DA_TC_NAME @"DA_TC_NAME"
#define DA_TC_DOCUMENTS @"DA_TC_DOCUMENTS"
#define DA_TC_TIME_REQUIRED @"DA_TC_TIME_REQUIRED"
#define DA_TC_REMINDER @"DA_TC_REMINDER"
#define DA_TC_REPEAT_AND_END @"DA_TC_REPEAT_AND_END"
#define DA_TC_NOTIFY_WHEN_COMPLETE @"DA_TC_NOTIFY_WHEN_COMPLETE"
#define DA_TC_TEXT_NOTES @"DA_TC_TEXT_NOTES"
#define DA_TC_VOICE_NOTES @"DA_TC_VOICE_NOTES"
#define DA_TC_LOCATION @"DA_TC_LOCATION"
#define DA_TC_DUE_TIME @"DA_TC_DUE_TIME"
#define DA_TC_PICTURES @"DA_TC_PICTURES"
#define DA_TC_VIDEOS @"DA_TC_VIDEOS"
#define DA_TC_LINKS @"DA_TC_LINKS"
#define DA_TC_PRODUCT @"DA_TC_PRODUCT"
#define DA_TC_AUTOSHIP @"DA_TC_AUTOSHIP"
#define DA_TC_CONTACT "DA_TC_CONTACT"
#define DA_TC_MULTIPLE_AUTOSHIPS @"DA_TC_MULTIPLE_AUTOSHIPS"
#define DA_TC_MULTIPLE_PRODUCTS @"DA_TC_MULTIPLE_PRODUCTS"
#define DA_TC_MULTIPLE_TASKS @"DA_TC_MULTIPLE_TASKS"


typedef NS_ENUM(NSInteger, DATaskType) {
    DATaskTypeTestimonial,
    DATaskTypeEvents,
    DATaskTypeProducts,
    DATaskTypeAutoship,
    DATaskTypeContacts,
    DATaskTypeTraining,
    DATaskTypeOthers,
    DATaskTypeCount
};

@interface DATaskDefine : DADataset


- (NSString *)textForTaskType:(DATaskType)type;
- (Class)taskDefineSectionClsForTaskType:(DATaskType)type;
- (Class)taskEditorClsForTaskType:(DATaskType)type;
- (UIImage *)iconImageForTaskType:(DATaskType)type;

@property (nonatomic, strong) NSArray *taskTexts;
@property (nonatomic, strong) NSArray *taskTypeItems;

@end
