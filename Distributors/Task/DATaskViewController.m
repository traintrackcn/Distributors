//
//  DATaskViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/27/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DATaskViewController.h"
#import "DATask.h"
#import "DATaskProgressEditor.h"
#import "DATaskImageCollectionCell.h"
#import "AGViewController+Datasource.h"
#import "AGViewController+Separator.h"
#import "DAStyleDefine.h"
#import "AGTextCellStyleMore.h"
#import "DATextDefine.h"
#import "AGTextCoordinator.h"
#import "DATaskReportViewController.h"
#import "DATaskNoteCell.h"
#import "DATaskAudioNoteCell.h"
#import "DATaskDueTimeCell.h"
#import "DATaskReminderCell.h"
#import "DATaskLocationCell.h"
#import "DATaskVideoCell.h"
#import "DATaskLinkCell.h"
#import "AGButtonCell.h"
#import "AGButtonItem.h"
#import "DADiscoverViewController.h"
#import "DATaskToolboxView.h"
#import "DAToolboxUnitView.h"

#import "DATaskDefineSection.h"

typedef NS_ENUM(NSInteger, Section) {
    SectionDefine,
    SectionImage,
    SectionReport,
    SectionNote,
    SectionLocation,
    SectionAudioNote,
    SectionDueTime,
    SectionReminder,
    SectionVideo,
    SectionLink,
    
    SectionEventToAttend,
    SectionEventToHost,
//    SectionButton,
    SectionCount
};

@interface DATaskViewController(){
    
}

@property (nonatomic, strong) UIBarButtonItem *writeLogBtnItem;
@property (nonatomic, strong) UIBarButtonItem *saveBtnItem;
@property (nonatomic, strong) DATaskToolboxView *toolBoxView;
@property (nonatomic, strong) DATaskDefineSection *defineSection;

@end

@implementation DATaskViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setBackgroundColor:STYLE_BACKGROUND_COLOR_DEFAULT];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    if (self.isLogBookAvailable) {
        [self.navigationItem setRightBarButtonItem:self.writeLogBtnItem];
    }
    
    if (self.isEditorAvailable) {
        [self.view addSubview:self.toolBoxView];
        [self.navigationItem setRightBarButtonItem:self.saveBtnItem];
    }
}

- (void)layoutViews{
    [super layoutViews];
    
    if (self.isEditorAvailable) {
        UIEdgeInsets originInset = self.tableView.contentInset;
        [self.tableView setContentInset:UIEdgeInsetsMake(originInset.top, 0, STYLE_NAVIGATION_BAR_HEIGHT, 0)];
    }
}

- (void)configSections{
    
    [self defineSection];
    
    [self.config setCellCls:[DATaskImageCollectionCell class] inSection:SectionImage];
    
    [self.config setCellCls:[AGTextCellStyleMore class] inSection:SectionReport];
    
    [self.config setCellCls:[DATaskNoteCell class] inSection:SectionNote];
    
    [self.config setCellCls:[DATaskLocationCell class] inSection:SectionLocation];

    [self.config setCellCls:[DATaskAudioNoteCell class] inSection:SectionAudioNote];
    
    [self.config setCellCls:[DATaskDueTimeCell class] inSection:SectionDueTime];
    
    [self.config setCellCls:[DATaskReminderCell class] inSection:SectionReminder];
    
    
    [self.config setCellCls:[DATaskVideoCell class] inSection:SectionVideo];
    [self.config setCellCls:[DATaskLinkCell class] inSection:SectionLink];
    
    [self.config setCellCls:[AGTextCellStyleMore class] inSection:SectionEventToAttend];
    [self.config setCellCls:[AGTextCellStyleMore class] inSection:SectionEventToHost];
//    [self.config setCellCls:[AGButtonCell class] inSection:SectionButton];
    
    [self enableSeparators];
}

#pragma mark - interactive ops

- (void)didTapWriteLog:(id)sender{
    DATaskProgressEditor *vc = [DATaskProgressEditor instance];
    [vc setItem:self.item];
    [self pushViewController:vc];
}

- (void)didTapSave:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didTapLocation:(id)sender{
    DADiscoverViewController *vc = [DADiscoverViewController instance];
    [self pushViewController:vc];
}

#pragma mark -

- (void)setItem:(DATask *)item{
    _item = item;
    [self setTitle:item.sentence];
    [self configSections];
}

#pragma mark - datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionImage){
//        if ([self isEditorAvailable]) return 2;
        return 1;
    }
    
    if (section == SectionReport && [self isSectionReportAvailable]) return 1;
    
    if (section == SectionNote){
//        if ([self isEditorAvailable]) return 2;
        return 1;
    }
    
    if (section == SectionLocation){
//        if ([self isEditorAvailable]) return 2;
        return 1;
    }
    
    if (section == SectionAudioNote){
//        if ([self isEditorAvailable]) return 2;
        return 1;
    }
    
    if (section == SectionDueTime){
//        if ([self isEditorAvailable]) return 2;
        return 1;
    }
    
    if (section == SectionReminder) {
//        if ([self isEditorAvailable]) return 2;
        return 1;
    }
    if (section == SectionVideo) return 0;
    if (section == SectionLink) return 0;
    if (section == SectionEventToAttend) return 3;
    if (section == SectionEventToHost) return 3;
//    if (section == SectionButton && [self isSectionButtonAvailable]) return 1;
    return [super numberOfRowsInSection:section];
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    id value = [super valueAtIndexPath:indexPath];
    
    if (section == SectionReport) {
        value = [AGTextCoordinator textForKey:KEY_LBL_REPORT];
    }
    
    if (section == SectionImage) {
        value = @[@"http://popchassid.com/wp-content/uploads/2013/05/Earth-the-universe-stars-435.jpg"
                  ,@"http://popchassid.com/wp-content/uploads/2013/05/milky-way1.jpg"
                  ,@"http://popchassid.com/wp-content/uploads/2013/05/Planet-earth.jpg"];
    }
    
    if (section == SectionNote) {
        value = @"Set yourself up for success. Your goal should work up to at least a case of product per month to supply your new distributors ...";
    }
    
    if (section == SectionReminder) {
        value = @"1 active alert";
    }
    
    if (section == SectionDueTime) {
        value = @"Mon 31 Aug, 6:30 PM";
    }
    
    if (section == SectionAudioNote) {
        value = @"This an audio note. Tap to play";
    }
    
    if (section == SectionLocation) {
        value = @"Santa Clara convention center";
    }
    
    if (section == SectionEventToAttend) {
        value = [NSString stringWithFormat:@"Event-%ld", idx];
    }
    
    if (section == SectionEventToHost) {
        value = [NSString stringWithFormat:@"Event-%ld", idx];
    }
    
//    if (section == SectionButton){
//        value = @[
//                  [AGButtonItem instanceWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] target:self action:@selector(didTapSave:)]
//                  ];
//    }
    
    return value;
}

- (id)valueForHeaderOfSection:(NSInteger)section{
    id value;
    
    if (section == SectionEventToAttend) {
        value = @"Events to attend";
    }
    
    if (section == SectionEventToHost) {
        value = @"Events to host";
    }
    
    return value;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger idx = indexPath.row;
    
    if (section == SectionReport) {
        DATaskReportViewController *vc = [DATaskReportViewController instance];
        [self pushViewController:vc];
    }
    
    if (section == SectionEventToHost || section == SectionEventToAttend) {
        DATaskViewController *vc = [DATaskViewController instance];
        [vc setItem:self.item];
        [self pushViewController:vc];
    }
    
    if (section == SectionLocation) {
//        if (idx == 1) {
        [self didTapLocation:nil];
//        }
    }
    
}



#pragma mark - components

- (UIBarButtonItem *)writeLogBtnItem{
    if (!_writeLogBtnItem) {
        _writeLogBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"IconPen"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapWriteLog:)];
    }
    return _writeLogBtnItem;
}


- (UIBarButtonItem *)saveBtnItem{
    if (!_saveBtnItem) {
        _saveBtnItem = [[UIBarButtonItem alloc] initWithTitle:[AGTextCoordinator textForKey:KEY_BTN_SAVE] style:UIBarButtonItemStylePlain  target:self action:@selector(didTapSave:)];
    }
    return _saveBtnItem;
}


- (DATaskToolboxView *)toolBoxView{
    if (!_toolBoxView) {
        CGFloat h = STYLE_TAB_BAR_HEIGHT;
        CGFloat y = [DSDeviceUtil bounds].size.height - h;
        CGFloat w = [DSDeviceUtil bounds].size.width;
        _toolBoxView = [[DATaskToolboxView alloc] initWithFrame:CGRectMake(0, y, w, h)];
//        [_toolBoxView setBackgroundColor:[UIColor greenColor]];
        
        for (NSInteger i = 0; i < _toolBoxView.subviews.count; i++) {
            DAToolboxUnitView *v = [_toolBoxView unitViewAtIndex:i];
            [v addTarget:self action:@selector(didTapLocation:)];
        }
        
    }
    return _toolBoxView;
}


- (DATaskDefineSection *)defineSection{
    if (!_defineSection) {
        Class cls = [[DAOpportunityCoordinator singleton] taskDefineSectionClsForTaskType:self.item.type];
        _defineSection = [cls instanceWithSection:SectionDefine config:self.config];
        [_defineSection setItem:self.item];
    }
    return _defineSection;
}



#pragma mark - switches

- (BOOL)isSectionReportAvailable{
    return YES;
}

- (BOOL)isSectionButtonAvailable{
    return NO;
}

- (BOOL)isLogBookAvailable{
    return YES;
}

- (BOOL)isEditorAvailable{
    return NO;
}

@end
