//
//  DADataset.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADataset.h"

@implementation DADataset


- (NSMutableDictionary *)data{
    if (!_data) {
        _data = [NSMutableDictionary dictionary];
    }
    return _data;
}

- (NSArray *)items{
    return self.data.allValues;
}

#pragma mark - utils

- (NSArray *)sortByKey:(NSString *)key ascending:(BOOL)ascending{
    NSSortDescriptor *sortDes = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *sortDesArr = [NSArray arrayWithObject:sortDes];
    NSArray *tmpArr = self.data.allValues;
    //    LOG_DEBUG(@"items -> %@", items);
    //    items = [items sortedArrayUsingDescriptors:sortDesArr];
    tmpArr = [tmpArr sortedArrayUsingDescriptors:sortDesArr];
    return tmpArr;
}

@end
