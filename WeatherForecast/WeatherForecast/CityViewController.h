//
//  CityViewController.h
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol nowViewControllerDelegate <NSObject>

- (void)nowcontent:(NSMutableArray *)array;

@end

@interface CityViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *cityArray;
@property (nonatomic, strong) NSMutableArray *headViewArray;
@property (nonatomic, strong) NSMutableArray *hourlyArray;
@property (nonatomic, strong) NSMutableArray *weeklyWeatherImageArray;
@property (nonatomic, strong) NSMutableArray *detailsMenuTodayArray;
@property (nonatomic, strong) NSMutableArray *detailsTodaytArray;
@property (nonatomic, strong) NSMutableArray *forecastArray;
@property (nonatomic, assign) NSString *str;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UIView *headView;

@property (nonatomic, assign) id<nowViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
