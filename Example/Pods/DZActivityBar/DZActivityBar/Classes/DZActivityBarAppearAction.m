//
//  DZActivityBarAppearAction.m
//  Pods
//
//  Created by baidu on 2017/1/17.
//
//

#import "DZActivityBarAppearAction.h"
#import "UIViewController+ActivityNavigationBar.h"
@implementation DZActivityBarAppearAction

+ (void) load
{
    DZVCRegisterGlobalAction([DZActivityBarAppearAction new]);
}

- (void) hostController:(UIViewController *)vc viewWillAppear:(BOOL)animated
{
    [super hostController:vc viewWillAppear:animated];
    [vc checkNeedActicityShowAnimations];
}

- (void) hostController:(UIViewController *)vc viewWillDisappear:(BOOL)animated
{
    [super hostController:vc viewWillDisappear:animated];
    [vc dzActivityRemoveAnimation];
}
@end
