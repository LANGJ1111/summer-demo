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
@property(nonatomic, strong)UIBarButtonItem *leftButton;
@property(nonatomic, strong)UIBarButtonItem *rightButton;
@property NSMutableArray *normalTextData;
@property NSMutableArray *normalImageData;
@property (nonatomic, strong)UISwitch *mySwitch;

@end

NS_ASSUME_NONNULL_END
