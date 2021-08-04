//
//  MainViewController.h
//  学生管理系统
//
//  Created by 浪极 on 2021/8/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
