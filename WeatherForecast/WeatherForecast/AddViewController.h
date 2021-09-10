//
//  AddViewController.h
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AddViewControllerDelegate <NSObject>

- (void)presscontent:(NSMutableArray *)array;

@end

@interface AddViewController : UIViewController

@property (nonatomic, strong) UITextField *searchTextFiled;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *cityArray;
@property (nonatomic, strong) NSMutableArray *searchArray;
@property (nonatomic, strong) NSMutableArray *nowArray;

@property (nonatomic, assign) id<AddViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
