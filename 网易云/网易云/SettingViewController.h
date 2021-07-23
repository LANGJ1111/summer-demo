//
//  SettingViewController.h
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import <UIKit/UIKit.h>
#import "SettingSubViewController.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "LastTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UIBarButtonItem *leftButton;
@property(nonatomic, strong)UIBarButtonItem *rightButton;
@property SettingSubViewController *settingSubViewController;

@property NSMutableArray *textArrayTwo;
@property NSMutableArray *textArrayThree;
@property NSMutableArray *textArrayFour;
@property NSMutableArray *textArrayFive;
@property NSMutableArray *normalTextData;

@property NSMutableArray *imageArrayTwo;
@property NSMutableArray *imageArrayThree;
@property NSMutableArray *imageArrayFour;
@property NSMutableArray *imageArrayFive;
@property NSMutableArray *normalImageData;

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)UISwitch *mySwitch;
@property(nonatomic, strong)UIView *footerView;
@property UITableViewCell *normalCell;
@property FirstTableViewCell *firstCell;
@property SecondTableViewCell *secondCell;
@property LastTableViewCell *lastCell;

@end

NS_ASSUME_NONNULL_END
