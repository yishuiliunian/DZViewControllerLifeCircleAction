//
//  UIViewController+ActivityNavigationBar.m
//  YaoHe
//
//  Created by stonedong on 8/11/16.
//  Copyright © 2016 stonedong. All rights reserved.
//

#import "UIViewController+ActivityNavigationBar.h"
#import <objc/runtime.h>
#import "DZActivityNavigationBar.h"


static void* kUIViewControllerNavigationBarKey = &kUIViewControllerNavigationBarKey;

@interface UIViewController ()
@property (nonatomic, assign, readonly) int activityNavigationSyncCount;
@end

@implementation UIViewController (ActivityNavigationBar)

- (void) setActivityNavigationSyncCount:(int)activityNavigationSyncCount
{
    objc_setAssociatedObject(self, kUIViewControllerNavigationBarKey, @(activityNavigationSyncCount), OBJC_ASSOCIATION_RETAIN);
}

- (int) activityNavigationSyncCount
{
    NSNumber* number = objc_getAssociatedObject(self, kUIViewControllerNavigationBarKey);
    if (!number) {
        return 0;
    } else {
        return [number intValue];
    }
}

- (void) checkNeedActicityShowAnimations
{
    void(^Action)(void) = ^(void) {
        if ([self.navigationController.navigationBar isKindOfClass:[DZActivityNavigationBar class]]) {
            DZActivityNavigationBar* bar = (DZActivityNavigationBar*)self.navigationController.navigationBar;
            if (self.activityNavigationSyncCount > 0) {
                [bar.activityView startAnimating];
            } else {
                [bar.activityView stopAnimating];
            }
        }
    };
    if ([NSThread isMainThread]) {
        Action();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            Action();
        });
    }
}

- (void) dzActivityRemoveAnimation
{
    void(^Action)(void) = ^(void) {
        if ([self.navigationController.navigationBar isKindOfClass:[DZActivityNavigationBar class]]) {
            DZActivityNavigationBar* bar = (DZActivityNavigationBar*)self.navigationController.navigationBar;
            [bar.activityView stopAnimating];
        }
    };
    if ([NSThread isMainThread]) {
        Action();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            Action();
        });
    }
}
- (void) increaseActivityCount
{
    int count = self.activityNavigationSyncCount;
    self.activityNavigationSyncCount = count+1;
    [self checkNeedActicityShowAnimations];
}

- (void) decreaseActivityCount
{
    int count = self.activityNavigationSyncCount;
    self.activityNavigationSyncCount = count-1;
    [self checkNeedActicityShowAnimations];
}
@end




