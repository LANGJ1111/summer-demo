//
//  SheZhiViewController.h
//  share
//
//  Created by 浪极 on 2021/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SheZhiViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *textArray;
@property (nonatomic, strong) UIAlertController *alert;

@end

NS_ASSUME_NONNULL_END

