//
//  UIView+YHAttachment.m
//  Pods
//
//  Created by baidu on 2017/1/17.
//
//

#import "UIView+YHAttachment.h"
#import <objc/runtime.h>

static void * kYHAttachmentKey = &kYHAttachmentKey;

@implementation UIView (YHAttachment)
- (void) setYh_isAttachment:(BOOL)yh_isAttachment
{
    objc_setAssociatedObject(self, kYHAttachmentKey, @(yh_isAttachment), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL) yh_isAttachment
{
    return [objc_getAssociatedObject(self, kYHAttachmentKey) boolValue];
}
@end
