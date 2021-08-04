//
//  XiaoXiSheZhiViewController.h
//  share
//
//  Created by 浪极 on 2021/8/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XiaoXiSheZhiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *array;

@end

NS_ASSUME_NONNULL_END
