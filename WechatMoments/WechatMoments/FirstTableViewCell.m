//
//  FirstTableViewCell.m
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"first"]) {
        _name = [[UILabel alloc] init];
        _text = [[UILabel alloc] init];
        _time = [[UILabel alloc] init];
        _head = [[UIButton alloc] init];
        _image = [[UIImageView alloc] init];
        
        _head.frame = CGRectMake(10, 10, 40, 40);
        _head.layer.masksToBounds = YES;
        _head.layer.cornerRadius = 5;
        _name.frame = CGRectMake(60, 15, 200, 15);
        _name.textColor = [UIColor colorWithRed:0.19 green:0.45 blue:1 alpha:1];
        _text.frame = CGRectMake(60, 40, 360, 15);
        _image.frame = CGRectMake(60, 65, 200, 200);
        _time.frame = CGRectMake(60, 280, 200, 15);
        _time.font = [UIFont systemFontOfSize:13];
        _time.textColor = [UIColor grayColor];
        
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_text];
        [self.contentView addSubview:_time];
        [self.contentView addSubview:_head];
        [self.contentView addSubview:_image];
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
