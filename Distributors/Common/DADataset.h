//
//  DADataset.h
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DADataset : NSObject

- (NSArray *)items;
- (NSArray *)sortByKey:(NSString *)key ascending:(BOOL)ascending;


@property (nonatomic, strong) NSMutableDictionary *data;


@end
