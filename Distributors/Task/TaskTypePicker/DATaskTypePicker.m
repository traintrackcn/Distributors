//
//  DATaskTypePicker.m
//  Distributors
//
//  Created by Tao Yunfei on 9/25/15.
//  Copyright © 2015 AboveGEM. All rights reserved.
//

#import "DATaskTypePicker.h"
#import "AGViewController+Datasource.h"
#import "AGTextCell.h"
#import "AGVCConfiguration.h"
#import "DATaskDefine.h"
#import "DATaskEditor.h"
#import "DATask.h"
#import "AGMenuTransitionDelegate.h"
#import "GlobalDefine.h"
#import "DATaskTypeCollectionViewCell.h"
#import "AGMenuAnimatedTransitioning.h"
#import "DATaskTypeItem.h"

@interface DATaskTypePicker () <UICollectionViewDataSource, UICollectionViewDelegate>{
    
}

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) AGMenuTransitionDelegate *transitioningDelegate;

@end

@implementation DATaskTypePicker


- (instancetype)init{
    self = [super init];
    if (self) {
        [self.config setCellCls:[AGTextCell class] inSection:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    self.collectionView 
    [self.collectionView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
}


#pragma mark - components

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        
        
        CGFloat itemW = [AGMenuAnimatedTransitioning singleton].presentingToVWidth/3.0;
        CGFloat itemH = [AGMenuAnimatedTransitioning singleton].presentingToVHeight/3.0;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setItemSize:CGSizeMake(itemW, itemH)];
        [layout setMinimumLineSpacing:0];
        [layout setMinimumInteritemSpacing:0];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        [_collectionView registerClass:self.collectionViewCellClass forCellWithReuseIdentifier:NSStringFromClass(self.collectionViewCellClass)];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
//        _collectionView.layer.borderWidth = 1;
    }
    return _collectionView;
}

#pragma mark -

- (DAOpportunity *)opportunity{
    return nil;
}

- (NSArray *)items{
    return [DATaskDefine singleton].taskTypeItems;
}


- (Class)collectionViewCellClass{
    return [DATaskTypeCollectionViewCell class];
}

#pragma mark - styles

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - transition

- (id<UIViewControllerTransitioningDelegate>)transitioningDelegate{
    //    return self.transitioningDelegate;
    if (!_transitioningDelegate){
        _transitioningDelegate = [[AGMenuTransitionDelegate alloc] init];
        [_transitioningDelegate setViewController:self];
    }
    return _transitioningDelegate;
}

#pragma mark - UICollectionViewDatasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) return self.items.count;
    return 0;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
//    Class cls = self.collectionViewCellCls;
    NSString *cellId = NSStringFromClass(self.collectionViewCellClass);
    id value = [self.items objectAtIndex:index];
    AGCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    [cell setValue:value];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    if (section == 0) {
        DATaskTypeItem *item = [self.items objectAtIndex:idx];
        [self dismissViewControllerAnimated:YES completion:^{
            AGViewController *vc = [item.editorCls instance];
            [self.viewConrollerPresentedFrom pushViewController:vc];
        }];
    }
}

@end
