//
//  DZViewControllerLifeCircleBaseAction.h
//  Pods
//
//  Created by baidu on 16/10/31.
//
//

#import <Foundation/Foundation.h>

@interface DZViewControllerLifeCircleBaseAction : NSObject
@property (nonatomic, strong) NSString* identifier;

- (void) hostController:(UIViewController*)vc viewWillAppear:(BOOL)animated;
- (void) hostController:(UIViewController*)vc viewDidAppear:(BOOL)animated;
- (void) hostController:(UIViewController*)vc viewWillDisappear:(BOOL)animated;
- (void) hostController:(UIViewController*)vc viewDidDisappear:(BOOL)animated;

@end
