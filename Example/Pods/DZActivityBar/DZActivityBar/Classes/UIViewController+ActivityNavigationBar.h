//
//  UIViewController+ActivityNavigationBar.h
//  YaoHe
//
//  Created by stonedong on 8/11/16.
//  Copyright © 2016 stonedong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ActivityNavigationBar)
- (void) increaseActivityCount;
- (void) decreaseActivityCount;

//
- (void) checkNeedActicityShowAnimations;
- (void) dzActivityRemoveAnimation;
@end
