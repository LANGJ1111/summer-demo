//
//  FirstTableViewCell.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"first"]) {
        _buttonOne = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonOne];
        _buttonTwo = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonTwo];
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
    }
    return self;
}

- (void)layoutSubviews {
    _buttonOne.frame = CGRectMake(10, 10, 80, 80);
    _buttonTwo.frame = CGRectMake(255, 35, 85, 30);
    _label.frame = CGRectMake(90, 35, 120, 30);
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
