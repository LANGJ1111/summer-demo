//
//  MineViewController.h
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import <UIKit/UIKit.h>
#import "MineSubViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineViewController : UIViewController<UIScrollViewDelegate>


//导航栏
@property(nonatomic, strong)UIBarButtonItem *leftButton;
@property(nonatomic, strong)UIBarButtonItem *rightButton;
@property(nonatomic, strong)UIButton *headButton;
@property MineSubViewController *mineSubViewController;


//滚动视图
@property(nonatomic, strong)UIScrollView *mainScrollView;
@property(nonnull, strong)UIView *subView;
@property(nonatomic, strong)UIScrollView *firstScrollView;
@property(nonatomic, strong)UIScrollView *secondScrollView;


//按钮&文本框
@property(nonatomic, strong)UIButton *buttonZeroZero;
@property(nonatomic, strong)UILabel  *labelZeroOne;
@property(nonatomic, strong)UIButton *buttonZeroTwo;
@property(nonatomic, strong)UIButton *buttonZeroThree;
@property(nonatomic, strong)UIButton *buttonZeroFour;

@property(nonatomic, strong)UIButton *buttonOneZero;
@property(nonatomic, strong)UIButton *buttonOneOne;
@property(nonatomic, strong)UIButton *buttonOneTwo;
@property(nonatomic, strong)UIButton *buttonOneThree;

@property(nonatomic, strong)UIButton *buttonTwoZero;

@property(nonatomic, strong)UIButton *buttonThreeZero;
@property(nonatomic, strong)UIButton *buttonThreeOne;
@property(nonatomic, strong)UIButton *buttonThreeTwo;
@property(nonatomic, strong)UIButton *buttonThreeThree;
@property(nonatomic, strong)UIButton *buttonThreeFour;
@property(nonatomic, strong)UIButton *buttonThreeFive;

@property(nonatomic, strong)UIButton *buttonFourZero;

@property(nonatomic, strong)UIButton *buttonFiveZero;
@property(nonatomic, strong)UIButton *buttonFiveOne;

@property(nonatomic, strong)UIButton *buttonSixZero;
@property(nonatomic, strong)UIButton *buttonSixOne;

@property(nonatomic, strong)UIButton *buttonSevenZero;
@property(nonatomic, strong)UIButton *buttonSevenOne;
@property(nonatomic, strong)UIButton *buttonSevenTwo;
@property(nonatomic, strong)UIButton *buttonSevenThree;
@property(nonatomic, strong)UIButton *buttonSevenFour;
@property(nonatomic, strong)UIButton *buttonSevenFive;
@property(nonatomic, strong)UIButton *buttonSevenSix;
@property(nonatomic, strong)UIButton *buttonSevenSeven;

@end

NS_ASSUME_NONNULL_END
