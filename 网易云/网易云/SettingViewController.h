//
//  SettingViewController.h
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property NSMutableArray *normalTextData;
@property NSMutableArray *normalImageData;

@end

NS_ASSUME_NONNULL_END
