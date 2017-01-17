//
//  DZActivityNavigationBar.m
//  YaoHe
//
//  Created by stonedong on 16/8/10.
//  Copyright © 2016年 stonedong. All rights reserved.
//

#import "DZActivityNavigationBar.h"
#import <objc/runtime.h>
#import "UIView+YHAttachment.h"

static NSString* kUIViewFrame = @"frame";

@interface DZActivityNavigationBar ()
@property (nonatomic, weak) UIView* yhCurrentTitleView;
@end

@implementation DZActivityNavigationBar
- (void) dealloc
{
    for (UIView* aView in self.subviews) {
        if (aView.yh_isAttachment) {
            [aView removeObserver:self forKeyPath:kUIViewFrame context:(__bridge void * _Nullable)(kUIViewFrame)];
            aView.yh_isAttachment = NO;
        }
    }
}
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _activityView = [UIActivityIndicatorView new];
    [_activityView sizeToFit];
    return self;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(UIView*)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:kUIViewFrame]) {
        if ([object isKindOfClass:[UIView class]] && object.yh_isAttachment) {
            CGSize size = _activityView.frame.size;
            size.height = 15;
            _activityView.frame = CGRectMake(-size.width-10, (CGRectGetHeight(object.frame) - size.height)/2, size.width, size.height);
        }
    }
}

- (void) didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];
    if ([subview isKindOfClass:NSClassFromString(@"UINavigationItemView")] && ![subview isKindOfClass:NSClassFromString(@"UINavigationItemButtonView")]) {
        if ([subview.subviews.firstObject isKindOfClass:[UILabel class]]) {
            if (!subview.yh_isAttachment) {
                [subview addObserver:self forKeyPath:kUIViewFrame options:NSKeyValueObservingOptionNew  context:(__bridge void * _Nullable)(kUIViewFrame)];
                subview.yh_isAttachment = YES;
            }
            [subview addSubview:_activityView];
            self.yhCurrentTitleView = subview;
        }
    }
}


- (void) willRemoveSubview:(UIView *)subview
{
    [super willRemoveSubview:subview];
    if (subview.yh_isAttachment) {
        [subview removeObserver:self forKeyPath:kUIViewFrame context:(__bridge void * _Nullable)(kUIViewFrame)];
        subview.yh_isAttachment = NO;
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}

@end
