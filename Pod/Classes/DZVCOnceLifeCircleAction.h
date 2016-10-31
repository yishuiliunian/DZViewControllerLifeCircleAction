//
//  DZVCOnceLifeCircleAction.h
//  Pods
//
//  Created by stonedong on 16/10/30.
//
//

#import "DZViewControllerLifeCircleBaseAction.h"

typedef void (^DZViewControllerOnceActionWhenAppear)(UIViewController* vc, BOOL animated);

@interface DZVCOnceLifeCircleAction : DZViewControllerLifeCircleBaseAction
@property (nonatomic, strong) DZViewControllerOnceActionWhenAppear actionBlock;

+ (instancetype) actionWithOnceBlock:(DZViewControllerOnceActionWhenAppear)block;
- (instancetype) initWithBlock:(DZViewControllerOnceActionWhenAppear)block;

@end
