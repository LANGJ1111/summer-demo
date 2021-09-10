//
//  MyTableViewCell.h
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *temperatureLabel;
@property (nonatomic, strong) UILabel *cityLabel;

@end

NS_ASSUME_NONNULL_END
