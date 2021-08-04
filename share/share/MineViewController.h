//
//  MineViewController.h
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy)NSArray *array;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UITableViewCell *cell;

@end

NS_ASSUME_NONNULL_END
