//
//  UIScrollView+STNoDataView.h
//  ScrollViewNoDataView
//
//  Created by shutong on 2019/4/10.
//  Copyright © 2019 shutong. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    NoDataTypeDefault,//没有数据
    NoDataTypeNetWork, //网络出错的视图
    NoDataTypeRequestError,//请求失败
    NoDataTypeRemoveView,//有数据了清除视图
} NoDataType;

@interface UIScrollView (STNoDataView)
/*
 大致思路是这样的：
 因为我们这个是给tableView和collectionView等基于scrollView的视图添加提示视图的，如果直接给视图添加提示视图会显得很生硬而且比较繁琐，所以我们这里就给scrollView来一个分类。
 但是呢，没有波澜的事情做着事没有动力的，那么我们的问题就来了呢，那就是类别中不能添加属性呢～，具体属性的实现之类的东西就牵扯到了元类这个玩意了，这里[参考了](https:\//draveness.me/ao)这篇文章。简单来说就是我们需要给这些个属性和scrollView进行关联
 这里呢 关联用到了这几个api
 ```
 //添加关联
 void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
 
 //获取关联
 id objc_getAssociatedObject(id object, const void *key);
 //移除关联,这里我们用不到他
 void objc_removeAssociatedObjects(id object);
 ```
 到了这里我们就来看下具体的代码实现
 */

/**
 数据类型
 */
@property (nonatomic, assign) NoDataType type;

/**
 默认没有数据显示的视图
 */
@property (nonatomic, strong ,nonnull) UIView * defaultNodataView;

/**
 网络出错的视图
 */
@property (nonatomic, strong ,nonnull) UIView * neterrorView;

/**
 请求出错的视图
 */
@property (nonatomic, strong ,nonnull) UIView * requestErrorView;

/**
 移除视图
 */
- (void)removeNoDataView;

@end

NS_ASSUME_NONNULL_END
