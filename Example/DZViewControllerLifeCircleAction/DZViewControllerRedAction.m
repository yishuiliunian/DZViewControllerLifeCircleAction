//
//  DZViewControllerRedAction.m
//  DZViewControllerLifeCircleAction
//
//  Created by baidu on 2017/1/17.
//  Copyright © 2017年 yishuiliunian. All rights reserved.
//

#import "DZViewControllerRedAction.h"

@implementation DZViewControllerRedAction
- (void) hostController:(UIViewController *)vc viewWillAppear:(BOOL)animated
{
    [super hostController:vc viewWillAppear:animated];
    vc.view.backgroundColor = [UIColor redColor];
}

@end
