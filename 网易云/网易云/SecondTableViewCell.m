//
//  SecondTableViewCell.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"second"]) {
        _buttonOne = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonOne];
        _buttonTwo = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonTwo];
        _buttonThree = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonThree];
        _buttonFour = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonFour];
    }
    return self;
}

- (void)layoutSubviews {
    _buttonOne.frame = CGRectMake(5, 0, 95, 100);
    _buttonTwo.frame = CGRectMake(100, 0, 95, 100);
    _buttonThree.frame = CGRectMake(195, 0, 95, 100);
    _buttonFour.frame = CGRectMake(290, 0, 95, 100);
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
