//
//  DATaskImageCollectionViewCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAImageCollectionUnitCell.h"
#import "GlobalDefine.h"
#import "AGRemoter.h"


@interface DAImageCollectionUnitCell(){
    UIImageView *imageV;
}

@end

@implementation DAImageCollectionUnitCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self assembleImageView];
    }
    return self;
}


#pragma mark - assemblers

- (void)assembleImageView{
    if (imageV) return;
        TLOG(@"frame -> %@", NSStringFromCGRect(self.frame));
    imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [imageV setContentMode:UIViewContentModeScaleAspectFill];
    [self addSubview:imageV];
    
    //    [imageV.layer setBorderWidth:1.0];
}

#pragma mark -

- (void)setValue:(id)value{
    
    if ([value isKindOfClass:[NSString class]]) {
        
        if ([[(NSString *)value uppercaseString] rangeOfString:@"http"].location == NSNotFound) {
            UIImage *img = [UIImage imageNamed:value];
            [imageV setImage:img];
            return;
        }
        
        
        value = [NSURL URLWithString:value];
        
        
    }else if([value isKindOfClass:[NSURL class]]){
        
    }else{
        return;
    }
    
    [self.remoter cancelAllImageRequests];
    [self.remoter REQUEST:(NSURL *)value forImageView:imageV placeholderImage:nil];
}


@end
