//
//  DAConversationViewController.m
//  Distributors
//
//  Created by Tao Yunfei on 9/10/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DAConversationViewController.h"
#import "DAStyleDefine.h"
#import "AGTextCell.h"
#import "AGViewController+Datasource.h"


typedef NS_ENUM(NSInteger, Section) {
    SectionItem,
    SectionCount
};

@interface DAConversationViewController(){
    
}

@property (nonatomic, strong) UIView *inputContainer;
@property (nonatomic, strong) UITextView *inputField;

@end

@implementation DAConversationViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setTitle:@"Serena"];
        [self.config setCellCls:[AGTextCell class] inSection:SectionItem];
        [self setBackgroundColor:RGBA(245, 245, 245, 1)];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.inputContainer];
    [self.inputContainer addSubview:self.inputField];
}

- (void)layoutViews{
    [super layoutViews];
    
    UIEdgeInsets contentInset = self.tableView.contentInset;
    [self.tableView setContentInset:UIEdgeInsetsMake(contentInset.top, 0, self.inputContainerH, 0)];
}

#pragma mark - table datasource

- (NSInteger)numberOfSections{
    return SectionCount;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    if (section == SectionItem) return 30;
    return 0;
}

- (id)valueAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    id value;
    if (section == SectionItem) {
        value = @"a message";
    }
    return value;
}

#pragma mark - components

- (UIView *)inputContainer{
    if (!_inputContainer) {
        CGFloat h = self.inputContainerH;
        CGFloat y = STYLE_DEVICE_HEIGHT - h;
        CGFloat w = STYLE_DEVICE_WIDTH;
        _inputContainer = [[UIView alloc] initWithFrame:CGRectMake(0, y, w, h)];
        [_inputContainer setBackgroundColor:RGBA(235, 236, 238, 1)];
        
        UIView *borderTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, STYLE_DEVICE_WIDTH, .5f)];
        [borderTopView setBackgroundColor:RGBA(205, 205, 205, 1)];
        [_inputContainer addSubview:borderTopView];
    }
    return _inputContainer;
}

- (UITextView *)inputField{
    if (!_inputField) {
        CGFloat x = 10;
        CGFloat y = 6;
        CGFloat w = STYLE_DEVICE_WIDTH - x*2;
        CGFloat h = self.inputContainerH - y*2;
        _inputField = [[UITextView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [_inputField setBackgroundColor:[UIColor whiteColor]];
        [_inputField.layer setBorderWidth:.5f];
        [_inputField.layer setCornerRadius:8.0];
        [_inputField.layer setBorderColor:RGBA(205, 205, 205, 1).CGColor];
        [_inputField setClipsToBounds:YES];
        [_inputField setFont:[AGStyleCoordinator fontWithSize:16.0]];
//        [_inputField setScrollEnabled:NO];
    }
    return _inputField;
}

#pragma mark - styles

- (CGFloat)inputContainerH{
    return 44.0;
}

@end
