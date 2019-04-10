//
//  UIScrollView+STNoDataView.h
//  ScrollViewNoDataView
//
//  Created by shutong on 2019/4/10.
//  Copyright © 2019 shutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDAutoLayout.h"
#import "STRequestErrorView.h"
#import "STNoDataView.h"
#import "STNoNetworkView.h"



NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    NoDataTypeDefault,//没有数据
    NoDataTypeNetWork, //网络出错的视图
    NoDataTypeRequestError,//请求失败
    NoDataTypeRemoveView,//有数据了清除视图
} NoDataType;

typedef void(^RefreshNodataViewBlock)(void);

@interface UIScrollView (STNoDataView)

/**
 数据类型
 */
@property (nonatomic, assign) NoDataType errorType;

/**
 默认没有数据显示的视图
 */
@property (nonatomic, strong ,nonnull) STNoDataView * defaultNodataView;

/**
 网络出错的视图
 */
@property (nonatomic, strong ,nonnull) STNoNetworkView * neterrorView;

/**
 请求出错的视图
 */
@property (nonatomic, strong ,nonnull) STRequestErrorView * requestErrorView;

/**
 视图数据刷新
 */
@property (nonatomic, copy) RefreshNodataViewBlock nodataBlock;

/**
 移除视图
 */
- (void)removeNoDataView;

@end

NS_ASSUME_NONNULL_END
