//
//  SecondTableViewCell.m
//  share
//
//  Created by 浪极 on 2021/7/27.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"second"]) {
        _leftImageView = [[UIImageView alloc] init];
        _firstLabel = [[UILabel alloc] init];
        _secondLabel = [[UILabel alloc] init];
        _thirdLabel = [[UILabel alloc] init];
        _fourthLabel = [[UILabel alloc] init];
        _firstButton = [[UIButton alloc] init];
        _secondButton = [[UIButton alloc] init];
        _thirdButton = [[UIButton alloc] init];
        
        
        [self.contentView addSubview:_leftImageView];
        [self.contentView addSubview:_firstLabel];
        [self.contentView addSubview:_secondLabel];
        [self.contentView addSubview:_thirdLabel];
        [self.contentView addSubview:_fourthLabel];
        [self.contentView addSubview:_firstButton];
        [self.contentView addSubview:_secondButton];
        [self.contentView addSubview:_thirdButton];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
