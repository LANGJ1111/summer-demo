//
//  LastTableViewCell.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "LastTableViewCell.h"

@implementation LastTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"last"]) {
        _button  = [[UIButton alloc] init];
        [self.contentView addSubview:_button];
    }
    return self;
}

- (void)layoutSubviews {
    _button.frame = CGRectMake(0, 0, 390, 100);
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
