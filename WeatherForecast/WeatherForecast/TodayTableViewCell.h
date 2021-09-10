//
//  TodayTableViewCell.h
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodayTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *titleproLabel;
@property (nonatomic,strong) UILabel *contentproLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@end

NS_ASSUME_NONNULL_END
