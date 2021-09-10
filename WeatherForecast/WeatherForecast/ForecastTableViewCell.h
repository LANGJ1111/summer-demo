//
//  ForecastTableViewCell.h
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForecastTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *dataLabel;
@property (nonatomic, strong) UIImageView *weatherImageView;
@property (nonatomic, strong) UILabel *maxLabel;
@property (nonatomic, strong) UILabel *minLabel;

@end

NS_ASSUME_NONNULL_END
