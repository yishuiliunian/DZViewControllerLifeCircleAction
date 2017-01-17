//
//  DZGeometryTools.h
//  TimeUI
//
//  Created by Stone Dong on 13-12-10.
//  Copyright (c) 2013年 Stone Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DZDevices.h"

//角度转化
#define DEGREE_TO_ANGLE(x) (x / 180.0f * M_PI)
#define ANGLE_TO_DEGREE(x) (x * 180.0f / M_PI)

//

#define CGRectViewWidth (CGRectGetWidth(self.bounds))
#define CGRectViewHeight CGRectGetHeight(self.bounds)

#define CGRectVCWidth (CGRectGetWidth(self.view.bounds))
#define CGRectVCHeight CGRectGetHeight(self.view.bounds)


#define CGRectGetViewControllerWidth (CGRectGetWidth(self.view.frame))
#define CGRectGetViewControllerHeight (CGRectGetHeight(self.view.frame))
#ifdef __cplusplus
extern "C"
{
#endif
    /**
     *  打印一个CGRect
     *
     *  @param rect 要打印的CGRect
     */
    void CGPrintRect(CGRect rect );
    
    void CGPrintKeyRect(NSString* prefixKey, CGRect rect );
    void CGPrintPoint(CGPoint point);
    float CGDistanceBetweenPoints(CGPoint p1, CGPoint p2);
    
    /**
     *  计算一个指定大小居中对齐时在指定区域的位置
     *
     *  @param rect 指定的区域
     *  @param size 指定大小
     *
     *  @return 指定大小居中对齐时在指定区域的位置
     */
    CGRect CGRectCenter(CGRect rect, CGSize size);
    CGPoint CGPointCenterRect(CGRect rect);
    CGRect CGRectUseEdge(CGRect parent, UIEdgeInsets edge);
    CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ);
    CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ);
    
    
    /**
     *  减去一个指定的大小，并返回计算后的区域
     *
     *  @param rect 原始区域
     *  @param size 需要减去的大小
     *
     *  @return 减去指定大小的区域
     */
    CGRect CGRectCenterSubSize(CGRect rect, CGSize size);
    CGRect CGRectWithEdgeInsetsForRect(UIEdgeInsets edge, CGRect rect);
    CGPoint CGRectGetCenter(CGRect rect);
    CGPoint CGPointSubtraction(CGPoint p1, CGPoint p2);
    CGSize CGSizeScaleToSize(CGSize originSize, CGSize aimSize);
    CGFloat CGPointDistance(CGPoint p1, CGPoint p2);
    CGSize CGSizeScale(CGSize size, CGFloat scale);
    //计算一个Size在Rect中的居住位置
    CGRect CGRectOfCenterForContainsSize(CGRect rect , CGSize size);
    BOOL NSRangeCotainsIndex(NSRange range, NSInteger index);
    //
    void LogCGRect(NSString* prefix, CGRect rect);
    void LogCGPoint(NSString* prefix, CGPoint point);
    void LogCGSize(NSString* prefix, CGSize point);
    NSString* DevicePlatfromString();
    BOOL UIDeviceISIphone5s();
    CGRect CGRectExpandPoint(CGPoint pint , CGSize aimSize);
    CGSize CGCurrentScreenSize();
    BOOL CGScrrentIsRetina();
    CGFloat CGPixMultiFactor();
    CGSize CGCurrentRealPixSize();
    
    //
    CGFloat CGRectHeightOffsetCenter(CGRect rect , CGFloat height);
    CGFloat CGRectWidthOffsetCenter(CGRect rect , CGFloat width);
    /**
     *  按照指定方向对Rect进行压缩
     *
     *  @param origin 原始的Rect
     *  @param offset 需要压缩的距离
     *  @param edge   压缩方向
     *
     *  @return 压缩好的Rect
     */
    CGRect CGRectShrink(CGRect origin, CGFloat offset, CGRectEdge edge);
    
    /**
     *  将一个Rect横向切割成多个
     *
     *  @param origin 原始REct
     *  @param rects  输出的rect们
     *  @param count  数量
     *  @param space  间距
     */
    void CGRectHorizontalSplit(CGRect origin, CGRect rects[], int count, CGFloat space);
    
    /**
     *  将一个Rect垂直切割成多个
     *
     *  @param origin 原始REct
     *  @param rects  输出的rect们
     *  @param count  数量
     *  @param space  间距
     */
    void CGRectVerticalSplit(CGRect origin, CGRect rects[], int count, CGFloat space);
    
    /**
     *  按照指定方向将一个Size偏移到参照Rect的对应位置
     *
     *  @param rect   参照Rect
     *  @param size   需要偏移的Size
     *  @param margin 中间的间距
     *  @param edge   指定方向
     *
     *  @return 偏移好的Rect
     */
    CGRect CGRectCenterOffsetSize(CGRect rect, CGSize size, CGFloat margin,  CGRectEdge edge);
    
    /**
     *  计算右下角的一个Rect
     *
     *  @param originRect 原始的Rect
     *  @param size       需要承载的Rect的大小
     *
     *  @return 返回大小为size位于originRect右下角的Rect
     */
    CGRect CGRectBottomRightCorner(CGRect originRect,  CGSize size);
    
    CGSize CGSizeAlignWidth(CGSize size, CGFloat width);
    CGSize CGSizeAlignHeight(CGSize size, CGFloat height);
    
    /**
     Cell初始化的时候的默认布局大小

     @return Cell的默认布局大小
     */
    
#define CGRectDefaultCell CGRectInitialCell()
    CGRect CGRectInitialCell();
   static  inline CGRect CGRectAlignInterge(CGRect rect) {
        CGRect aimRect = rect;
        aimRect.size.width = floor(rect.size.width);
        aimRect.size.height = floor(rect.size.height);
        aimRect.origin.x = floor(rect.origin.x);
        aimRect.origin.y = floor(aimRect.origin.y);
        return aimRect;
    }
    
#ifdef __cplusplus
}
#endif

#define CGRectSetX(rect, x) CGRectMake(x, CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect));
#define CGRectSetY(rect, y) CGRectMake(CGRectGetMinX(rect), y, CGRectGetWidth(rect), CGRectGetHeight(rect));
#define CGRectSetWidth(rect, width) CGRectMake(x , y, width , CGRectGetHeight(rect));
#define CGRectSetHeight(rect, height) CGRectMake(x, y, CGRectGetWidth(rect), width);

#define LAYOUT_View_Frame(view, x, y , width, height) view.frame = CGRectMake(x,y, width, height)
#define LAYOUT_SubView_Fill(view) view.frame = self.bounds


#define MARGIN_LEFT left
#define MARGIN_RIGHT right
#define MARGIN_ALL all


#define MARGIN_NAME_X(subfix) margin_x_##subfix
#define MARGIN_NAME_Y(subfix) margin_y_##subfix


#define MARGIN_NAME_X_ALL MARGIN_NAME_X(MARGIN_X_ALL)


#define LAYOUT_DEFINE_MARGIN_X(subfix, x) static float MARGIN_NAME_X(subfix)  = x
#define LAYOUT_DEFINE_MARGIN_Y(subfix, y) static float MARGIN_NAME_Y(subfix)  = y
#define LAYOUT_DEFINE_MARGIN_X_ALL(x) LAYOUT_DEFINE_MARGIN_X(MARGIN_ALL,x)
#define LAYOUT_DEFINE_MARGIN_Y_ALL(x) LAYOUT_DEFINE_MARGIN_Y(MARGIN_ALL,x)


#define LAYOUT_RECT_ORIGIN_RELY_MIN_X(rect, view, margin_x) rect.origin.x = CGRectGetMinX(view.frame) + margin_x
#define LAYOUT_RECT_ORIGIN_RELY_MAX_X(rect, view, margin_x) rect.origin.x = CGRectGetMaxX(view.frame) + margin_x
#define LAYOUT_RECT_ORIGIN_RELY_MIN_Y(rect, view, margin_y) rect.origin.y = CGRectGetMinY(view.frame) + margin_y
#define LAYOUT_RECT_ORIGIN_RELY_MAX_Y(rect, view, margin_y) rect.origin.y = CGRectGetMaxY(view.frame) + margin_y


#define LAYOUT_VIEW_RELY_MAX_X_Y(view, xRV, xMargin,yRV, yMargin,  width_, height_) CGRect rect##view = CGRectZero;\
LAYOUT_RECT_ORIGIN_RELY_MAX_X(rect##view, xRV, xMargin);\
LAYOUT_RECT_ORIGIN_RELY_MAX_Y(rect##view, yRV, yMargin);\
rect##view.size.width = width_;\
rect##view.size.height = height_;


//y依赖于顶部元素，并且尽可能填充满width的布局
#define LAYOUT_SUBVIEW_FILL_WIDTH_RELY_MAX_Y(view, supView, xMargin, yRV, yMargin, height__) CGRect rect##view = CGRectZero;\
LAYOUT_RECT_ORIGIN_RELY_MAX_Y(rect##view, yRV, yMargin);\
rect##view.size.width = CGRectGetWidth(supView.frame) - xMargin*2;\
rect##view.origin.x = xMargin;\
rect##view.size.height = height__;\
view.frame = rect##view;

#define LAYOUT_VIEW_FILL_WIDTH_RELY_MAX_Y(view, xMargin, yRV, yMargin, height__)\
LAYOUT_SUBVIEW_FILL_WIDTH_RELY_MAX_Y(view, self, xMargin, yRV, yMargin, height__)

//顶部固定高度，铺满width的布局
#define LAYOUT_VIEW_TOP_FILL_WIDTH(view, sView__, xMargin, yMargin, refHeight__)  CGRect rect##view = CGRectZero;\
rect##view.origin.x = xMargin;\
rect##view.origin.y = yMargin;\
rect##view.size.width = CGRectGetWidth(sView__.bounds) - xMargin*2;\
rect##view.size.height = refHeight__ - yMargin;\
view.frame = rect##view;

#define LAYOUT_SUBVIEW_TOP_FILL_WIDTH(view, xMargin, yMargin, refHeight__)  LAYOUT_VIEW_TOP_FILL_WIDTH(view, self, xMargin, yMargin, refHeight__)



//顶部固定高度，铺满width的布局
#define LAYOUT_VIEW_BOTTOM_FILL_WIDTH(view, sView__, xMargin, yMargin, refHeight__)  CGRect rect##view = CGRectZero;\
rect##view.origin.x = xMargin;\
rect##view.origin.y = CGRectGetHeight(sView__.bounds) - refHeight__;\
rect##view.size.width = CGRectGetWidth(sView__.bounds) - xMargin*2;\
rect##view.size.height = refHeight__ - yMargin;\
view.frame = rect##view;

#define LAYOUT_SUBVIEW_BOTTOM_FILL_WIDTH(view, xMargin, yMargin, refHeight__)  LAYOUT_VIEW_BOTTOM_FILL_WIDTH(view, self, xMargin, yMargin, refHeight__)

#define LAYOUT_SUBVIEW_CENTER(view, refSV, xMargin ,yMargin)  view.frame = CGRectCenter(refSV.bounds, CGSizeMake(CGRectGetWidth(refSV.bounds) - xMargin*2,CGRectGetHeight(refSV.bounds) - yMargin*2));

