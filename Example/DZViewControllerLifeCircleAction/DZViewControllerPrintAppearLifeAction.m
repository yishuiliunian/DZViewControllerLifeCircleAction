//
//  DZViewControllerPrintAppearLifeAction.m
//  DZViewControllerLifeCircleAction
//
//  Created by baidu on 2017/1/17.
//  Copyright © 2017年 yishuiliunian. All rights reserved.
//

#import "DZViewControllerPrintAppearLifeAction.h"

@implementation DZViewControllerPrintAppearLifeAction
//全局注册，每一次VC都会打印
+ (void) load
{
    DZVCRegisterGlobalAction([DZViewControllerPrintAppearLifeAction new]);
}

- (void) hostController:(UIViewController *)vc viewWillAppear:(BOOL)animated
{
    [super hostController:vc viewWillAppear:animated];
    NSLog(@"ViewController [%@] -- %@",vc, NSStringFromSelector(_cmd));
}

- (void) hostController:(UIViewController *)vc viewDidAppear:(BOOL)animated
{
    [super hostController:vc viewDidAppear:animated];
    NSLog(@"ViewController [%@] -- %@",vc, NSStringFromSelector(_cmd));
}
- (void) hostController:(UIViewController *)vc viewWillDisappear:(BOOL)animated
{
    [super hostController:vc viewWillDisappear:animated];
}

- (void) hostController:(UIViewController *)vc viewDidDisappear:(BOOL)animated
{
    [super hostController:vc viewDidDisappear:animated];
    NSLog(@"ViewController [%@] -- %@",vc, NSStringFromSelector(_cmd));

}
@end
