//
//  SecondTableViewCell.h
//  share
//
//  Created by 浪极 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondTableViewCell : UITableViewCell<UITableViewDelegate>

@property (nonatomic, strong)UIImageView *leftImageView;
@property (nonatomic, strong)UILabel *firstLabel;
@property (nonatomic, strong)UILabel *secondLabel;
@property (nonatomic, strong)UILabel *thirdLabel;
@property (nonatomic, strong)UILabel *fourthLabel;
@property (nonatomic, strong)UIButton *firstButton;
@property (nonatomic, strong)UIButton *secondButton;
@property (nonatomic, strong)UIButton *thirdButton;

@end

NS_ASSUME_NONNULL_END
