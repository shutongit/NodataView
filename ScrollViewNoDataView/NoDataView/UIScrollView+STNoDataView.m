//
//  UIScrollView+STNoDataView.m
//  ScrollViewNoDataView
//
//  Created by shutong on 2019/4/10.
//  Copyright © 2019 shutong. All rights reserved.
//

#import "UIScrollView+STNoDataView.h"
#import <objc/runtime.h>
#import "SDAutoLayout.h"

#import "STNoDataView.h"
#import "STNoNetworkView.h"
#import "STRequestErrorView.h"

@implementation UIScrollView (STNoDataView)

/**
 移除视图
 */
- (void)removeNoDataView
{
    self.type = NoDataTypeRemoveView;
}

/**
 getter方法

 @return 获取type的类型
 */
- (NoDataType)type
{
//    这里的 _cmd 代指当前方法的选择子，也就是 @selector(type)。
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

/**
 给type赋值

 @param type type description
 */
- (void)setType:(NoDataType)type
{
    if ([self.defaultNodataView superview]) {
        [self.defaultNodataView removeFromSuperview];
    }
    if (self.neterrorView.superview) {
        [self.neterrorView removeFromSuperview];
    }
    if (self.requestErrorView.superview) {
        [self.requestErrorView removeFromSuperview];
    }
    
    if (type == NoDataTypeDefault) {
        [self addSubview:self.defaultNodataView];
        self.defaultNodataView.sd_layout
        .leftEqualToView(self)
        .rightEqualToView(self)
        .topEqualToView(self)
        .bottomEqualToView(self);
    } else if (type == NoDataTypeNetWork)
    {
        [self addSubview:self.neterrorView];
        self.neterrorView.sd_layout
        .leftEqualToView(self)
        .rightEqualToView(self)
        .topEqualToView(self)
        .bottomEqualToView(self);
    } else if (type == NoDataTypeRequestError)
    {
        [self addSubview:self.requestErrorView];
        self.requestErrorView.sd_layout
        .leftEqualToView(self)
        .rightEqualToView(self)
        .topEqualToView(self)
        .bottomEqualToView(self);
    }

    objc_setAssociatedObject(self, @selector(type), @(type), OBJC_ASSOCIATION_ASSIGN);
}

/**
 获取默认没有数据视图

 @return return value description
 */
- (UIView *)defaultNodataView
{
    //现获取一下是否存在这个视图
    UIView *nodata = objc_getAssociatedObject(self, @selector(defaultNodataView));
    if (nodata == nil) {
        nodata = [[STNoDataView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        //b如果不存在则添加关联
        objc_setAssociatedObject(self, @selector(defaultNodataView), nodata, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return nodata;
}
- (void)setDefaultNodataView:(UIView *)defaultNodataView
{
    objc_setAssociatedObject(self, @selector(defaultNodataView), defaultNodataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 获取网络错误的视图
 
 @return return value description
 */
- (UIView *)neterrorView
{
    //现获取一下是否存在这个视图
    UIView *neterror = objc_getAssociatedObject(self, @selector(neterrorView));
    if (neterror == nil) {
        neterror = [[STNoNetworkView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        //b如果不存在则添加关联
        objc_setAssociatedObject(self, @selector(neterrorView), neterror, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return neterror;
}
- (void)setNeterrorView:(UIView *)neterrorView
{
    objc_setAssociatedObject(self, @selector(neterrorView), neterrorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 获取请求出错的视图
 
 @return return value description
 */
- (UIView *)requestErrorView
{
    //现获取一下是否存在这个视图
    UIView *requestError = objc_getAssociatedObject(self, @selector(requestErrorView));
    if (requestError == nil) {
        requestError = [[STRequestErrorView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        //b如果不存在则添加关联
        objc_setAssociatedObject(self, @selector(requestErrorView), requestError, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return requestError;
}
- (void)setRequestErrorView:(UIView *)requestErrorView
{
    objc_setAssociatedObject(self, @selector(requestErrorView), requestErrorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
