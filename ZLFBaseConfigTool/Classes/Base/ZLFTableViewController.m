//
//  ZLFTableViewController.m
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "ZLFTableViewController.h"
#import "ZLFConstant.h"
@interface ZLFTableViewController ()

@end

@implementation ZLFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.page = 1;
    self.pageSize = 10;
}

- (UITableView *)baseTabeleviewGrouped
{
    if (_baseTabeleviewGrouped ==nil) {
        _baseTabeleviewGrouped = [[UITableView alloc]initWithFrame:(CGRect){0,0,SWIDTH,SHEIGHT - navgationBarHeight}  style:UITableViewStyleGrouped];
        _baseTabeleviewGrouped.delegate = self;
        _baseTabeleviewGrouped.dataSource = self;
        _baseTabeleviewGrouped.separatorColor = LINECOLOR;
        _baseTabeleviewGrouped.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _baseTabeleviewGrouped.showsVerticalScrollIndicator = NO;
        _baseTabeleviewGrouped.backgroundColor = LINECOLOR;
        [self adjustsScrollViewInsets:_baseTabeleviewGrouped controller:self];
        
        [self.view addSubview:_baseTabeleviewGrouped];
    }
    return _baseTabeleviewGrouped;
    
}


- (UITableView *)baseTabeleviewPlain
{
    if (_baseTabeleviewPlain ==nil) {
        _baseTabeleviewPlain = [[UITableView alloc]initWithFrame:(CGRect){0,0,SWIDTH,SHEIGHT - navgationBarHeight}  style:UITableViewStylePlain];
        _baseTabeleviewPlain.delegate = self;
        _baseTabeleviewPlain.dataSource = self;
        _baseTabeleviewPlain.separatorColor = LINECOLOR;
        _baseTabeleviewPlain.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _baseTabeleviewPlain.showsVerticalScrollIndicator = NO;
        _baseTabeleviewPlain.backgroundColor = LINECOLOR;
        [self adjustsScrollViewInsets:_baseTabeleviewPlain controller:self];
        [self.view addSubview:_baseTabeleviewPlain];
    }
    return _baseTabeleviewPlain;
}

#pragma mark -  tableview代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identfier = @"cel";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfier];
    }
    cell.textLabel.text = @"我是cell";
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}

//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
//    return [UIImage imageNamed:@"wechat money"];
//}
//
//- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
//    NSAttributedString *att = [[NSAttributedString alloc]initWithString:
//                               @"暂无收取调度服务费的网点" attributes:@{NSForegroundColorAttributeName:GAYCOLOR}];
//
//    return att;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSMutableArray *)dataSources  {
    if (!_dataSources) {
        _dataSources = [NSMutableArray new];
    }
    return _dataSources;
}

- (void)adjustsScrollViewInsets:(UIScrollView*)scrollView controller:(UIViewController *)controller {
    if (@available(iOS 11.0,*)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewIndexDisplayModeAutomatic;
    }else{
        controller.automaticallyAdjustsScrollViewInsets = NO;
    }
}
@end
