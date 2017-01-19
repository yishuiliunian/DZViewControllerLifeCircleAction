//
//  DZCenterButtonAction.m
//  DZViewControllerLifeCircleAction
//
//  Created by baidu on 2017/1/17.
//  Copyright © 2017年 yishuiliunian. All rights reserved.
//

#import "DZCenterButtonAction.h"
#import <DZGeometryTools/DZGeometryTools.h>
@interface DZCenterButtonAction ()
@end

@implementation DZCenterButtonAction
@synthesize button = _button;
- (UIButton*) button
{
    if (!_button) {
        _button = [UIButton new];
    }
    CGRectDivide(<#CGRect rect#>, <#CGRect * _Nonnull slice#>, <#CGRect * _Nonnull remainder#>, <#CGFloat amount#>, <#CGRectEdge edge#>)
    return _button;
}
- (void) hostController:(UIViewController *)vc viewDidAppear:(BOOL)animated
{
    [super hostController:vc viewDidAppear:animated];
    [vc.view addSubview:_button];
    _button.frame = CGRectCenter(vc.view.bounds, CGSizeMake(180, 44));
}
@end
