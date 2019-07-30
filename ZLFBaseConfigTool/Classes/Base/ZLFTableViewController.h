//
//  ZLFTableViewController.h
//  ZLFBaseConfigTool_Example
//
//  Created by zluof on 2019/7/30.
//  Copyright © 2019 zluof. All rights reserved.
//

#import "ZLFBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZLFTableViewController : ZLFBaseViewController<UITableViewDelegate,UITableViewDataSource>

/**baseTableview*/
@property (nonatomic, strong)UITableView *baseTabeleviewPlain;

/**baseTableview*/
@property (nonatomic, strong)UITableView *baseTabeleviewGrouped;

/**titlesArr*/
@property (nonatomic, strong)NSMutableArray *dataSources;

/**page 分页 默认为 1*/
@property (nonatomic, assign) int page;

/**pageSize 每页数量 默认为 10*/
@property (nonatomic, assign) int pageSize;
@end

NS_ASSUME_NONNULL_END
