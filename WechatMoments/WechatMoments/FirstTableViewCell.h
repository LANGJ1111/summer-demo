//
//  FirstTableViewCell.h
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *text;
@property (nonatomic, strong)UILabel *time;
@property (nonatomic, strong)UIButton *head;
@property (nonatomic, strong)UIImageView *image;

@end

NS_ASSUME_NONNULL_END
