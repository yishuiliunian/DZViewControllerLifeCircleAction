//
//  DZViewController.m
//  DZViewControllerLifeCircleAction
//
//  Created by yishuiliunian on 11/04/2016.
//  Copyright (c) 2016 yishuiliunian. All rights reserved.
//

#import "DZViewController.h"
#import <DZViewControllerLifeCircleAction/DZViewControllerLifeCircleAction.h>
#import "DZViewControllerRedAction.h"
#import "DZCenterButtonAction.h"
#import <DZURLRoute/DZURLRoute.h>

@interface DZViewController ()

@end

@implementation DZViewController

+ (void) load
{
    [[DZURLRoute defaultRoute] addRoutePattern:@"inner://first" handler:^DZURLRouteResponse *(DZURLRouteRequest *request) {
        [request.context.topNavigationController pushViewController:[self new] animated:YES];
        return [DZURLRouteResponse successResponse];
    }];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerLifeCircleAction:[DZViewControllerRedAction new]];
    ;
    // block输入为id类型，您可以自定义成自己的类型，比如这里改成了DZViewController。只在第一次展示的时候，执行刷新动作。这里会弹出一个提示
    [self registerLifeCircleAction:[DZVCOnceLifeCircleAction actionWithOnceBlock:^(DZViewController *vc, BOOL animated) {
        [vc reloadFirstData];
    }]];
    
    DZCenterButtonAction* buttonAction = [DZCenterButtonAction new];
    [buttonAction.button setTitle:@"加载下DemoVC" forState:UIControlStateNormal];
    [buttonAction.button addTarget:self action:@selector(loadDemoViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self registerLifeCircleAction:buttonAction];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) loadDemoViewController
{
    [[DZURLRoute defaultRoute] routeURL:DZURLRouteQueryLink(@"inner://demo", @{})];
}

- (void) reloadFirstData
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"第一次显示执行刷新动作" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
