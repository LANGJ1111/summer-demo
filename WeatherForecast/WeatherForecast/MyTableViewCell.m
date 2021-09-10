//
//  MyTableViewCell.m
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/3.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _cityLabel = [[UILabel alloc] init];
    _temperatureLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_cityLabel];
    [self.contentView addSubview:_temperatureLabel];
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _cityLabel.frame = CGRectMake(5, 15, 100, 30);
    _cityLabel.font = [UIFont systemFontOfSize:23];
    _cityLabel.textAlignment = NSTextAlignmentCenter;
    _cityLabel.textColor = [UIColor whiteColor];
    
    _temperatureLabel.frame = CGRectMake(270, 25, 100, 20);
    _temperatureLabel.font = [UIFont systemFontOfSize:25];
    _temperatureLabel.textAlignment = NSTextAlignmentCenter;
    _temperatureLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
