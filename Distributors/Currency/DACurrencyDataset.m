//
//  DACurrencyCoordinator.m
//  Distributors
//
//  Created by Tao Yunfei on 8/18/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DACurrencyDataset.h"
#import "DACurrency.h"

@interface DACurrencyDataset(){
    NSArray *_sortedItems;
}



@end

@implementation DACurrencyDataset


- (instancetype)init{
    self = [super init];
    if (self) {
        [self declareDatasetIsDictionary];
        [self.data setObject:[DACurrency instanceWithSymbol:@"$" code:@"US"] forKey:@"US"];
        [self.data setObject:[DACurrency instanceWithSymbol:@"C$" code:@"CA"] forKey:@"CA"];
        [self.data setObject:[DACurrency instanceWithSymbol:@"£" code:@"UK"] forKey:@"UK"];
        [self.data setObject:[DACurrency instanceWithSymbol:@"¥" code:@"CN"] forKey:@"CN"];
    }
    return self;
}

- (DACurrency *)defaultItem{
    return [self itemForCode:@"US"];
}

- (DACurrency *)itemForCode:(NSString *)code{
    return [self.data objectForKey:code.uppercaseString];
}

- (NSArray *)sortedItems{
    if (!_sortedItems) {
        _sortedItems = [self sortByKey:@"code" ascending:YES];
    }
    return _sortedItems;
}





@end
