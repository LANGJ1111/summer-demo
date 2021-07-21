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
    }
    return self;
}

- (void)layoutSubviews {
    _buttonOne.frame = CGRectMake(30, 10, 30, 100);
    _buttonTwo.frame = CGRectMake(350, 10, 30, 100);
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
