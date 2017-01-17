//
//  DZGeometryTools.m
//  TimeUI
//
//  Created by Stone Dong on 13-12-10.
//  Copyright (c) 2013年 Stone Dong. All rights reserved.
//

#import "DZGeometryTools.h"
#import "UIDeviceHardware.h"
NSString* DevicePlatfromString()
{
    static NSString* str = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        str =  [UIDeviceHardware platformString];
    });
    return str;
}


BOOL UIDeviceISIphone5s()
{
    static BOOL isiphone5s = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isiphone5s =  [DevicePlatfromString() isEqualToString:IPHONE_5S];
    });
    return isiphone5s;
    return isiphone5s;
}

void LogCGRect(NSString* prefix, CGRect rect)
{
    NSLog(@"%@, x:%f--y:%f--width:%f--height:%f",prefix, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}
void LogCGPoint(NSString* prefix, CGPoint point)
{
    NSLog(@"%@ , x:%f--y:%f",prefix,point.x, point.y );
}
void LogCGSize(NSString* prefix, CGSize size)
{
    NSLog(@"%@, width:%f--height:%f",prefix ,size.width, size.height);
}

CGPoint CGRectGetCenter(CGRect rect)
{
    return CGPointMake(CGRectGetMinX(rect) + CGRectGetWidth(rect) /2.0, CGRectGetMinY(rect) + CGRectGetHeight(rect)/ 2.0f);
}

CGPoint CGPointSubtraction(CGPoint p1, CGPoint p2)
{
    return CGPointMake(p1.x - p2.x, p1.y - p2.y);
}
CGFloat CGPointDistance(CGPoint p1, CGPoint p2)
{
    return sqrtf(powf(p1.x - p2.x , 2) + pow(p1.y - p2.y, 2));
}

CGRect CGRectWithEdgeInsetsForRect(UIEdgeInsets edge, CGRect rect)
{
    return CGRectMake(CGRectGetMinX(rect) + edge.left, CGRectGetMinY(rect) + edge.top, CGRectGetWidth(rect) - edge.left- edge.right, CGRectGetHeight(rect) - edge.top - edge.bottom);
}

CGSize CGSizeScaleToSize(CGSize originSize, CGSize aimSize)
{
    if (originSize.width < originSize.height) {
        return CGSizeMake(aimSize.width, originSize.height * aimSize.width/ originSize.width);
    }
    else
    {
        return CGSizeMake(originSize.width * aimSize.height / originSize.height, aimSize.height);
    }
}

CGSize CGSizeScale(CGSize size, CGFloat scale)
{
    return CGSizeMake(size.width * scale, size.height * scale);
}
CGRect CGRectCenterSubSize(CGRect rect, CGSize size)
{
    float aimWidth = (CGRectGetWidth(rect) - size.width );
    float aminHeiht  = CGRectGetHeight(rect) - size.height;
    return CGRectMake(CGRectGetMinX(rect) +  size.width/2, CGRectGetMinY(rect) + size.height/2, aimWidth, aminHeiht);
}

BOOL NSRangeCotainsIndex(NSRange range, NSInteger index)
{
    return index >= range.location && index < range.location + index;
}

CGRect CGRectOfCenterForContainsSize(CGRect rect , CGSize size)
{
    return CGRectMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect) - size.width)/2, CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size.height) /2, size.width, size.height);
}

void CGPrintRect(CGRect rect )
{
    NSLog(@"rec--|origin x:%f |y:%f |width:%f | height:%f", CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect));
}
void CGPrintKeyRect(NSString* prefixKey, CGRect rect )
{
       NSLog(@"key:(%@) rec--|origin x:%f |y:%f |width:%f | height:%f",prefixKey, CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect));
}

void CGPrintPoint(CGPoint point) {
    NSLog(@"the point x:%f y:%f",point.x, point.y);
}
CGRect CGRectExpandPoint(CGPoint pint , CGSize aimSize)
{
    return CGRectMake(pint.x - aimSize.width/2, pint.y - aimSize.height/2, aimSize.width, aimSize.height);
}

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}
CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}


CGRect CGRectUseEdge(CGRect parent, UIEdgeInsets edge)
{
    float startX =CGRectGetMinX(parent) + edge.left;
    float startY = CGRectGetMinY(parent) + edge.top;
    float endX = CGRectGetMaxX(parent) - edge.right;
    float endY = CGRectGetMaxY(parent) - edge.bottom;
    return CGRectMake(startX, startY, endX - startX, endY - startY);
}

CGPoint CGPointCenterRect(CGRect rect)
{
    return CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect)/2);
}

float CGDistanceBetweenPoints(CGPoint p1, CGPoint p2)
{
    return sqrt(pow(p1.x - p2.x, 2) + pow(p1.y - p2.y, 2));
}

CGRect CGRectCenter(CGRect rect, CGSize size)
{
    return CGRectMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect) - size.width) /2,
                      CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size.height) /2,
                      size.width,
                      size.height);
}

CGSize CGCurrentScreenSize()
{
    return [[UIScreen mainScreen] applicationFrame].size;
}

CGFloat CGRectHeightOffsetCenter(CGRect rect , CGFloat height) {
    return CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height)/2;
}

CGFloat CGRectWidthOffsetCenter(CGRect rect , CGFloat width) {
    return CGRectGetMinX(rect) + (CGRectGetWidth(rect) - width)/2;
}

BOOL CGScrrentIsRetina()
{
    if ([[UIScreen mainScreen] currentMode].size.width > 320) {
        return YES;
    }
    return NO;
}

CGFloat CGPixMultiFactor()
{
    if (CGScrrentIsRetina()) {
        return 2.0f;
    }
    return 1.0f;
}

CGSize CGCurrentRealPixSize()
{
    return CGSizeScale(CGCurrentScreenSize(), CGPixMultiFactor());
}

CGRect CGRectShrink(CGRect origin, CGFloat offset, CGRectEdge edge) {
    CGRect rect = origin;
    switch (edge) {
        case CGRectMinYEdge:
        {
            rect.origin.y += offset;
            rect.size.height -= offset;
            break;
        }
        case CGRectMinXEdge:
        {
            rect.origin.x += offset;
            rect.size.width -= offset;
            break;
        }
        case CGRectMaxXEdge:
        {
            rect.size.width -= offset;
            break;
        }
        case CGRectMaxYEdge:
        {
            rect.size.height -= offset;
            break;
        }
            
        default:
            break;
    }
    return rect;
    
}

void CGRectHorizontalSplit(CGRect origin, CGRect rects[], int count, CGFloat space) {
    if (count == 0) {
        return;
    }
    CGFloat width = CGRectGetWidth(origin);
    width -= space*(count-1);
    CGFloat itemSize = width/count;
    CGRect firstRect = CGRectMake(CGRectGetMinX(origin), CGRectGetMinY(origin), itemSize, CGRectGetHeight(origin));
    for (int i = 0; i < count; i++) {
        CGRect origin = CGRectOffset(firstRect, itemSize*i + space*i, 0);
        rects[i].origin.x = origin.origin.x;
        rects[i].origin.y = origin.origin.y;
        rects[i].size.width = origin.size.width;
        rects[i].size.height = origin.size.height;
    }
}

void CGRectVerticalSplit(CGRect origin, CGRect rects[], int count, CGFloat space) {
    if (count == 0) {
        return;
    }
    CGFloat height = CGRectGetHeight(origin);
    height -= space*(count-1);
    CGFloat itemSize = height/count;
    CGRect firstRect = CGRectMake(CGRectGetMinX(origin), CGRectGetMinY(origin), CGRectGetWidth(origin), itemSize);
    for (int i = 0; i < count; i++) {
        CGRect origin = CGRectOffset(firstRect, 0 , itemSize*i + space*i);
        rects[i].origin.x = origin.origin.x;
        rects[i].origin.y = origin.origin.y;
        rects[i].size.width = origin.size.width;
        rects[i].size.height = origin.size.height;
    }
}




CGRect CGRectCenterOffsetSize(CGRect rect, CGSize size, CGFloat margin,  CGRectEdge edge) {
    CGRect aim;
    aim.size = size;
    switch (edge) {
        case CGRectMaxXEdge:
        {
            aim.origin.x = CGRectGetMaxX(rect) + margin ;
            aim.origin.y = CGRectHeightOffsetCenter(rect, size.height);
        }
            break;
        case CGRectMaxYEdge:
        {
            aim.origin.x = CGRectWidthOffsetCenter(rect, size.width);
            aim.origin.y = CGRectGetMaxY(rect) + margin;
        }
            break;
            
        case CGRectMinXEdge:{
            aim.origin.x = CGRectGetMinX(rect) - margin - size.width;
            aim.origin.y = CGRectHeightOffsetCenter(rect, size.height);
        }
            break;
        case CGRectMinYEdge:{
            aim.origin.x = CGRectWidthOffsetCenter(rect, size.width);
            aim.origin.y = CGRectGetMinY(rect) - margin - size.height;
        }
            break;
        default:
            break;
    }
    
    return aim;
}

CGSize CGSizeAlignWidth(CGSize size, CGFloat width){
    CGSize aimSize;
    aimSize.width = width;
    if (width > 0) {
        aimSize.height =  width / size.width * size.height;
    }
    return aimSize;
}
CGSize CGSizeAlignHeight(CGSize size, CGFloat height) {
    CGSize aimSize;
    aimSize.height = height;
    if (height > 0) {
        aimSize.width = height / size.height * size.width;
    }
    
    return aimSize;
}


CGRect CGRectBottomRightCorner(CGRect originRect,  CGSize size) {
    CGRect buttonRect;
    buttonRect.origin.x = CGRectGetWidth(originRect) - size.width;
    buttonRect.origin.y = CGRectGetHeight(originRect) - size.height;
    buttonRect.size = size;
    return buttonRect;
};


CGRect CGRectInitialCell()
{
    static CGRect rect;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rect = [UIScreen mainScreen].bounds;
        rect.size.height = CGFLOAT_MAX;
    });
    return rect;
}
