//
//  SubHomeViewController.h
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubHomeViewController : UIViewController

@property (nonatomic, strong)UIButton *firstButton;
@property (nonatomic, strong)UIButton *secondButton;
@property (nonatomic, strong)UIButton *thirdButton;
@property (nonatomic, assign)int zan;
@property (nonatomic, assign)int zanIsSelected;
@property (nonatomic, assign)int guanzhu;
@property (nonatomic, assign)int share;

@property (nonatomic, copy)void (^backBlock) (int zanNumber, int guanzhuNumber, int shareNumber);

@end

NS_ASSUME_NONNULL_END
