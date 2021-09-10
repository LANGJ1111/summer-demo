//
//  ForecastTableViewCell.m
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import "ForecastTableViewCell.h"

@implementation ForecastTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.dataLabel = [[UILabel alloc] init];
    self.weatherImageView = [[UIImageView alloc] init];
    self.maxLabel = [[UILabel alloc] init];
    self.minLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.dataLabel];
    [self.contentView addSubview:self.weatherImageView];
    [self.contentView addSubview:self.maxLabel];
    [self.contentView addSubview:self.minLabel];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.dataLabel.frame = CGRectMake(20, 10, 120, 30);
    self.dataLabel.textColor = [UIColor whiteColor];
    self.weatherImageView.frame = CGRectMake(170, 10, 25,25);
    self.maxLabel.frame = CGRectMake(270, 10, 30, 30);
    self.maxLabel.textColor = [UIColor whiteColor];
    self.minLabel.frame = CGRectMake(320, 10, 30, 30);
    self.minLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
