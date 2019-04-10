
#### 1、导入`#import "NoDataManager.h"`头文件
#### 2、添加提示视图
只需要调用` errorType`
`self.tableView.errorType = NoDataTypeNetWork; `这个属性就行了
#### 3、调用提示视图的刷新按钮
        ```
        self.tableView.nodataBlock = ^{
        NSLog(@"调用提示视图的刷新按钮");
        };
        ```
#### 4、移除视图
#### 4.1、直接调用方法 `[self.tableView removeNoDataView];`
#### 4.2、调用` errorType`属性，赋值为`NoDataTypeRemoveView`类型即可




![提示视图](https://github.com/shutongit/Images/commit/66272934969e551f50fed09a9235589424460abc?short_path=2f94d37#diff-2f94d377c9cdfba4e5bd87fc753b96aa)
