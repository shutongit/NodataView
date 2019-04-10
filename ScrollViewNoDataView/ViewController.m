//
//  ViewController.m
//  ScrollViewNoDataView
//
//  Created by shutong on 2019/4/10.
//  Copyright © 2019 shutong. All rights reserved.
//

#import "ViewController.h"
#import "NoDataManager.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 基础视图
 */
@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self loadData];
}

- (void)refreshData
{
    if (self.dataSource.count > 0) {
        [self.dataSource removeAllObjects];
        [self.tableView reloadData];
    } else {
        [self loadData];
    }
    if (self.dataSource.count > 0) {
        //移除提示视图
        [self.tableView removeNoDataView];
        
    } else {
        //添加提示视图
        self.tableView.errorType = NoDataTypeRequestError;
        __weak typeof(self)weakSelf = self;
        self.tableView.nodataBlock = ^{
            NSLog(@"调用提示视图的刷新按钮");
        };
        self.tableView.nodataBlock = ^{
            [weakSelf.dataSource addObjectsFromArray:@[@"点击刷新之后。1",@"点击刷新之后。2",@"点击刷新之后。3",@"点击刷新之后。4",@"点击刷新之后。5",@"点击刷新之后。6"]];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView removeNoDataView];
        };
    }
}

#pragma mark ************* tableView dataSource  *************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}
#pragma mark ************* tableView delegate *************
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark ************* load data *************
- (void)loadData
{
    [self.dataSource addObjectsFromArray:@[@"数据源·1",@"数据源·2",@"数据源·3"]];
    [self.tableView reloadData];
}

#pragma mark ************* create UI *************
- (void)createUI
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(refreshData)];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

#pragma mark ************* lazy load *************
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}
@end
