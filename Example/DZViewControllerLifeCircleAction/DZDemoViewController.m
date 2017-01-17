//
//  DZDemoViewController.m
//  DZViewControllerLifeCircleAction
//
//  Created by baidu on 2017/1/17.
//  Copyright © 2017年 yishuiliunian. All rights reserved.
//

#import "DZDemoViewController.h"
#import "DZViewControllerRedAction.h"
#import "DZCenterButtonAction.h"
#import <DZURLRoute/DZURLRoute.h>
@interface DZDemoViewController ()

@end

@implementation DZDemoViewController
+ (void) load
{
    [[DZURLRoute defaultRoute] addRoutePattern:@"inner://demo" handler:^DZURLRouteResponse *(DZURLRouteRequest *request) {
        DZDemoViewController* demoVC = [self new];
        //可以不用在VC的函数里面去写控制VC业务逻辑的代码，直接在生成实例的地方进行逻辑注入，这里注入了一个染色为红色的逻辑
        [demoVC registerLifeCircleAction:[DZViewControllerRedAction new]];
        
        //这个注入了一个和第一个界面相同的button显示的逻辑，这个例子更加体现了逻辑容器的概念
        DZCenterButtonAction* buttonAction = [DZCenterButtonAction new];
        [buttonAction.button setTitle:@"加载下ViewController" forState:UIControlStateNormal];
        [buttonAction.button addTarget:demoVC action:@selector(loadDemoViewController) forControlEvents:UIControlEventTouchUpInside];
        [demoVC registerLifeCircleAction:buttonAction];
        [request.context.topNavigationController pushViewController:demoVC animated:YES];
        return [DZURLRouteResponse successResponse];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) loadDemoViewController
{
    [[DZURLRoute defaultRoute] routeURL:DZURLRouteQueryLink(@"inner://first", @{})];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
