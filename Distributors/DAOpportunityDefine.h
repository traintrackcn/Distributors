//
//  DAOpportunityDefine.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

typedef NS_ENUM(NSInteger, OpportunityTaskType) {
    OpportunityTaskTypeDefault,
    OpportunityTaskTypeEnrollment,
    OpportunityTaskTypeOrganizingEvent,
    OpportunityTaskTypeAttendingEvent,
    OpportunityTaskTypePurchasingProducts,
    OpportunityTaskTypeSetUpAutoship,
    OpportunityTaskTypeCreatingContacts,
    OpportunityTaskTypeCount
};


typedef NS_ENUM(NSInteger, OpportunityTaskPeriod) {
    OpportunityTaskPeriodDay,
    OpportunityTaskPeriodWeek,
    OpportunityTaskPeriodMonth,
    OpportunityTaskPeriodCount
};
