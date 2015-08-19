//
//  DADataset.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DADataset.h"

@implementation DADataset


- (void)declareDatasetIsDictionary{
    if (!_data) {
        _data = [NSMutableDictionary dictionary];
    }
}

- (void)declareDatasetIsArray{
    if (!_data) {
        _data = [NSMutableArray array];
    }
}

#pragma mark -

- (NSArray *)items{
    
    if ([self.data isKindOfClass:[NSMutableArray class]]) {
        return (NSMutableArray *)self.data;
    }
    
    return [(NSMutableDictionary *)self.data allValues];
}

- (NSArray *)sortedItems{
    return self.items;
}

#pragma mark - utils

- (NSArray *)sortByKey:(NSString *)key ascending:(BOOL)ascending{
    NSSortDescriptor *sortDes = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *sortDesArr = [NSArray arrayWithObject:sortDes];
    NSArray *tmpArr = self.items;
    //    LOG_DEBUG(@"items -> %@", items);
    //    items = [items sortedArrayUsingDescriptors:sortDesArr];
    tmpArr = [tmpArr sortedArrayUsingDescriptors:sortDesArr];
    return tmpArr;
}

@end
