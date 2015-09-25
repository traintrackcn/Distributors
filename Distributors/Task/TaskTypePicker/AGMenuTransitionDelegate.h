//
//  AGMenuTransitionDelegate.h
//  AboveGEM
//
//  Created by traintrackcn on 4/12/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class AGViewController;
@interface AGMenuTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, weak) AGViewController *viewController;

@end
