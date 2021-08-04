//
//  XinGuanZhuViewController.h
//  share
//
//  Created by 浪极 on 2021/8/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XinGuanZhuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *textArray;

@end

NS_ASSUME_NONNULL_END
