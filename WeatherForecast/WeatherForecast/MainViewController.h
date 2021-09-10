//
//  MainViewController.h
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton* addButton;
@property (nonatomic, strong) NSMutableArray *cityArray;
@property (nonatomic, strong) NSMutableArray *temperatureArray;
@property (nonatomic, assign) BOOL select;

@end

NS_ASSUME_NONNULL_END
