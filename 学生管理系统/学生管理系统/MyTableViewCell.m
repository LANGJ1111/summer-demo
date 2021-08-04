//
//  MyTableViewCell.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/4.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"main"]) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(10, 0, 120, 40);
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLabel];
        
        _classLabel = [[UILabel alloc] init];
        _classLabel.frame = CGRectMake(130, 0, 120, 40);
        _classLabel.backgroundColor = [UIColor clearColor];
        _classLabel.font = [UIFont systemFontOfSize:20];
        _classLabel.textColor = [UIColor whiteColor];
        _classLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_classLabel];
        
        _gradeLabel = [[UILabel alloc] init];
        _gradeLabel.frame = CGRectMake(260, 0, 120, 40);
        _gradeLabel.backgroundColor = [UIColor clearColor];
        _gradeLabel.font = [UIFont systemFontOfSize:20];
        _gradeLabel.textColor = [UIColor whiteColor];
        _gradeLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_gradeLabel];
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
