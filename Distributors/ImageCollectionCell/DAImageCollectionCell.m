//
//  DATaskThemeCell.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAImageCollectionCell.h"
#import "DAImageCollectionUnitCell.h"
#import "GlobalDefine.h"
#import "DSDeviceUtil.h"

@interface DAImageCollectionCell(){
    UIPageControl *pageControl;
    CGFloat pageControlH;
}

@end

@implementation DAImageCollectionCell

+ (CGFloat)height{
    return 300;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        pageControlH = 20.0;
        
        [self.collectionView setShowsHorizontalScrollIndicator:NO];
        [self assemblePageControl];
        [self assembleGC];
    }
    return self;
}


- (Class)collectionViewCellCls{
    return [DAImageCollectionUnitCell class];
}

#pragma mark - assemblers

- (void)assemblePageControl{
    CGFloat w = [DSDeviceUtil bounds].size.width;
    CGFloat y =  self.height - pageControlH;
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, y, w, pageControlH)];
    [pageControl setPageIndicatorTintColor:RGBA(242, 242, 242, 1)];
    [pageControl setCurrentPageIndicatorTintColor:RGBA(212, 212, 212, 1)];
    [self.contentView addSubview:pageControl];
    //    [pageControl setBackgroundColor:[UIColor redColor]];
//    pageControl.layer.borderWidth = 1;
    
//    self.collectionView.layer.borderWidth = 1;
}

#pragma mark -

- (void)activateSelector{
    NSDictionary *action = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"GotoPhotoBrowser",@"type",
                            [NSNumber numberWithInteger:selectedIndex],@"current-image-index",
                            nil];
    [self dispatchRequestAction:action];
}

#pragma mark - selection ops

- (void)selectIndexAndDispatchSelectedItem:(NSInteger)index{
    [super selectIndexAndDispatchSelectedItem:index];
    [pageControl setCurrentPage:index];
}

#pragma mark - value ops

- (void)setValue:(id)value{
    [super setValue:value];
    
    [pageControl setNumberOfPages:self.items.count];
}


@end
