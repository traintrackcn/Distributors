//
//  DANavigationController.m
//  Distributors
//
//  Created by Tao Yunfei on 8/26/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "DANavigationController.h"
#import "DAStyleDefine.h"
#import "DSImage.h"
#import "DSDeviceUtil.h"
#import "GlobalDefine.h"

@interface DANavigationController(){
    
}
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIColor *realTintColor;
@end

@implementation DANavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self applyStyle];
    
}

- (void)applyStyle{
    [self.navigationBar setBackgroundImage:self.backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    if ([DSDeviceUtil iOS8AndAbove]) {
        [self.navigationBar setTranslucent:YES];
    }
    
    [self.navigationBar setTintColor:[AGStyleCoordinator colorForKey:@"navigation-bar-button-title"]];
    //    UIFont *f = [self fontForKey:@"navigation-bar-title"];
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [AGStyleCoordinator colorForKey:@"navigation-bar-title"],NSForegroundColorAttributeName,
                                               [AGStyleCoordinator fontWithSize:20], NSFontAttributeName,
                                               nil];
    [self.navigationBar setTitleTextAttributes:navbarTitleTextAttributes];
}

#pragma mark - styles

- (UIImage *)backgroundImage{
    return [DSImage rectangleWithSize:CGSizeMake(1.0, 1.0) fillColor:self.realTintColor];
}

- (UIColor *)realTintColor{
    if (!_realTintColor) {
        NSArray *rgbArr = [AGStyleCoordinator rgbForKey:@"navigation-bar-background"];
//    TLOG(@"rgbArr -> %@", rgbArr);
        _realTintColor = [DSImage navigationBarTintColorFromRed:[[rgbArr objectAtIndex:0] floatValue]
                                                      green:[[rgbArr objectAtIndex:1] floatValue]
                                                       blue:[[rgbArr objectAtIndex:2] floatValue]];
        
    }
    return _realTintColor;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}



@end
