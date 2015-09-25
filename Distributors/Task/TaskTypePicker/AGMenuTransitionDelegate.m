//
//  AGMenuTransitionDelegate.m
//  AboveGEM
//
//  Created by traintrackcn on 4/12/14.
//
//

#import "AGMenuTransitionDelegate.h"
#import "AGMenuAnimatedTransitioning.h"

@interface AGMenuTransitionDelegate(){
    

}

@property (nonatomic, strong) id transitioning;

@end

@implementation AGMenuTransitionDelegate


- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark - properties

- (id)transitioning{
    if (!_transitioning){
        _transitioning = [[AGMenuAnimatedTransitioning alloc] init];
        [_transitioning setViewController:self.viewController];
    }
    return _transitioning;
}

#pragma mark -

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    [self.transitioning setIsPresenting:YES];
    return self.transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    [self.transitioning setIsPresenting:NO];
    return self.transitioning;
}

@end
