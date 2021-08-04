//
//  HeadTableViewCell.m
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import "HeadTableViewCell.h"

@implementation HeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"head"]) {
        _background = [[UIImageView alloc] init];
        _head = [[UIButton alloc] init];
        _name = [[UILabel alloc] init];
        
        _background.frame = CGRectMake(0, 0, 390, 330);
        _head.frame = CGRectMake(290, 260, 80, 80);
        _head.layer.masksToBounds = YES;
        _head.layer.cornerRadius = 10;
        _name.frame = CGRectMake(195, 295, 80, 30);
        _name.font = [UIFont systemFontOfSize:20];
        _name.textColor = [UIColor whiteColor];
        [_background setImage:[UIImage imageNamed:@"background.jpg"]];
        [_head setImage:[UIImage imageNamed:@"head.jpg"] forState:UIControlStateNormal];
        _name.text = @"浪极";
        _name.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview:_background];
        [self.contentView addSubview:_head];
        [self.contentView addSubview:_name];
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
