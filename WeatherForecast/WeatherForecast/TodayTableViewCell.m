//
//  TodayTableViewCell.m
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import "TodayTableViewCell.h"

@implementation TodayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.titleLabel = [[UILabel alloc] init];
    self.contentLabel = [[UILabel alloc] init];
    self.titleproLabel = [[UILabel alloc]init];
    self.contentproLabel = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleproLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contentproLabel];
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleproLabel.frame = CGRectMake(250, 10, 375, 20);
    self.titleproLabel.font = [UIFont systemFontOfSize:15];
    self.titleproLabel.textColor = [UIColor whiteColor];
    self.titleLabel.frame = CGRectMake(20, 10, 375, 20);
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.contentLabel.frame = CGRectMake(20, 35, 375, 40);
    self.contentLabel.font = [UIFont systemFontOfSize:15];
    self.contentLabel.textColor = [UIColor whiteColor];
    self.contentproLabel.frame = CGRectMake(250, 35, 375, 40);
    self.contentproLabel.font = [UIFont systemFontOfSize:15];
    self.contentproLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
