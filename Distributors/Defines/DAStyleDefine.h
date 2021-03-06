//
//  DAStyleDefine.h
//  Distributors
//
//  Created by Tao Yunfei on 8/19/15.
//  Copyright (c) 2015 AboveGEM. All rights reserved.
//

#import "AGStyleCoordinator.h"
#import "NSObject+Singleton.h"
#import "DSDeviceUtil.h"
#import "GlobalDefine.h"

#define STYLE_PADDING_LR_DEFAULT 15.0
#define STYLE_BORDER_COLOR_DEFAULT RGBA(222, 222, 222, 1)
#define STYLE_BACKGROUND_COLOR_DEFAULT [AGStyleCoordinator colorBackgroundNormal]
#define STYLE_NAVIGATION_BAR_HEIGHT 44.0
#define STYLE_STATUS_BAR_HEIGHT 20.0
#define STYLE_TAB_BAR_HEIGHT 50.0
#define STYLE_DEVICE_WIDTH [DSDeviceUtil bounds].size.width
#define STYLE_DEVICE_HEIGHT [DSDeviceUtil bounds].size.height

#define STYLE_THEME_COLOR [AGStyleCoordinator colorTheme]
#define STYLE_THEME_COLOR_2 RGBA(254, 165, 107, 1)

#define STYLE_TEXT_COLOR_SUBTITLE RGBA(170,170,170,1)

#define STYLE_COLOR_COMPLETED RGBA(112, 214, 104, 1)
#define STYLE_INDICATOR_COLOR RGBA(245,74,55,1)

#define STYLE_ICON_COLOR_UNSELECTED RGBA(146, 146, 146, 1)
#define STYLE_TAB_BAR_BORDER_COLOR RGBA(178, 178, 178, 1)


#define STYLE_ANIMATION_INTERVAL .33f