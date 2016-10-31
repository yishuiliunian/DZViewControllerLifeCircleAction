//
//  UIViewController+appearSwizzedBlock.h
//  Pods
//
//  Created by stonedong on 16/10/29.
//
//

#import <UIKit/UIKit.h>

#import "DZViewControllerLifeCircleBaseAction.h"
@interface UIViewController (appearSwizzedBlock)
- (void)registerLifeCircleAction:(DZViewControllerLifeCircleBaseAction *)action;
- (void) removeLifeCircleAction:(DZViewControllerLifeCircleBaseAction *)action;
@end

FOUNDATION_EXTERN void DZVCRemoveGlobalAction(DZViewControllerLifeCircleBaseAction* action);
FOUNDATION_EXTERN void DZVCRegisterGlobalAction(DZViewControllerLifeCircleBaseAction* action);
