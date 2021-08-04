//
//  MineViewController.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "MineViewController.h"
#import "MineSubViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"mine.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    导
//    航
//    栏
//    设
//    置
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationController.view.tintColor = [UIColor blackColor];
    
    _leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"yunpan.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = _leftButton;
    
    _rightButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"xiaotouxiang.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(pressRight)];
    _headButton = [[UIButton alloc] initWithFrame:CGRectMake(360, 0, 30, 30)];
    [_headButton setImage:[UIImage imageNamed:@"xiaotouxiang.jpeg"] forState:UIControlStateNormal];
    [_headButton.layer setMasksToBounds:YES];
    [_headButton.layer setCornerRadius:15];
    _rightButton = [[UIBarButtonItem alloc] initWithCustomView:_headButton];
    self.navigationItem.rightBarButtonItem=_rightButton;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
//    主
//    滚
//    动
//    视
//    图
//    设
//    置
    _mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 0, 390, 830);
    _mainScrollView.pagingEnabled = NO;
    _mainScrollView.contentSize = CGSizeMake(390, 850);
    _mainScrollView.bounces = YES;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.showsHorizontalScrollIndicator = YES;
    _mainScrollView.backgroundColor = [UIColor blackColor];
    _mainScrollView.delegate = self;

    _subView = [[UIView alloc] initWithFrame:CGRectMake(0, 220, 390, 800)];
    _subView.backgroundColor = [UIColor whiteColor];
    _subView.layer.masksToBounds = YES;
    _subView.layer.cornerRadius = 30;
    
    [_mainScrollView addSubview:_subView];
    
    
    
//    按
//    钮
//    设
//    置
    _buttonZeroZero = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 60, 60)];
    [_buttonZeroZero setImage:[UIImage imageNamed:@"touxiang.jpeg"] forState:UIControlStateNormal];
    _buttonZeroZero.layer.masksToBounds = YES;
    _buttonZeroZero.layer.cornerRadius = 30;
    [_mainScrollView addSubview:_buttonZeroZero];
    
    _labelZeroOne = [[UILabel alloc] initWithFrame:CGRectMake(95, 35, 120, 30)];
    _labelZeroOne.text = @"芝麻凛";
    _labelZeroOne.font = [UIFont systemFontOfSize:25];
    _labelZeroOne.textColor = [UIColor whiteColor];
    [_mainScrollView addSubview:_labelZeroOne];
    
    _buttonZeroTwo = [[UIButton alloc] initWithFrame:CGRectMake(95, 70, 60, 20)];
    [_buttonZeroTwo setTitle:@"黑胶VIP" forState:UIControlStateNormal];
    _buttonZeroTwo.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1];
    _buttonZeroTwo.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonZeroTwo.titleLabel.font = [UIFont systemFontOfSize:12];
    _buttonZeroTwo.titleLabel.textColor = [UIColor colorWithWhite:0.1 alpha:0.1];
    _buttonZeroTwo.layer.masksToBounds = YES;
    _buttonZeroTwo.layer.cornerRadius = 10;
    [_mainScrollView addSubview:_buttonZeroTwo];
    
    _buttonZeroThree = [[UIButton alloc] initWithFrame:CGRectMake(160, 70, 40, 20)];
    [_buttonZeroThree setTitle:@"Lv.7" forState:UIControlStateNormal];
    _buttonZeroThree.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
    _buttonZeroThree.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonZeroThree.titleLabel.font = [UIFont systemFontOfSize:14];
    _buttonZeroThree.titleLabel.textColor = [UIColor colorWithWhite:0.1 alpha:0.1];
    _buttonZeroThree.layer.masksToBounds = YES;
    _buttonZeroThree.layer.cornerRadius = 10;
    [_mainScrollView addSubview:_buttonZeroThree];
    
    _buttonZeroFour = [[UIButton alloc] initWithFrame:CGRectMake(270, 45, 120, 20)];
    [_buttonZeroFour setTitle:@"开通黑胶VIP >" forState:UIControlStateNormal];
    _buttonZeroFour.backgroundColor = [UIColor clearColor];
    _buttonZeroFour.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonZeroFour.titleLabel.font = [UIFont systemFontOfSize:15];
    [_buttonZeroFour setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _buttonZeroFour.layer.masksToBounds = YES;
    _buttonZeroFour.layer.cornerRadius = 10;
    [_mainScrollView addSubview:_buttonZeroFour];
    
    
    
    _buttonOneZero = [[UIButton alloc] initWithFrame:CGRectMake(30, 120, 80, 80)];
    [_buttonOneZero setTitle:@"本地音乐" forState:UIControlStateNormal];
    [_buttonOneZero setImage:[UIImage imageNamed:@"xiazai.png"] forState:UIControlStateNormal];
    _buttonOneZero.backgroundColor = [UIColor clearColor];
    [_buttonOneZero setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonOneZero.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonOneZero.titleLabel.font = [UIFont systemFontOfSize:14];
    _buttonOneZero.imageEdgeInsets = UIEdgeInsetsMake(0, 19, 20, 0);
    _buttonOneZero.titleEdgeInsets = UIEdgeInsetsMake(50, -33, 0, 10);
    _buttonOneZero.layer.masksToBounds = YES;
    _buttonOneZero.layer.cornerRadius = 10;
    [_mainScrollView addSubview:_buttonOneZero];
    
    _buttonOneOne = [[UIButton alloc] initWithFrame:CGRectMake(115, 120, 80, 80)];
    [_buttonOneOne setTitle:@"我的电台" forState:UIControlStateNormal];
    [_buttonOneOne setImage:[UIImage imageNamed:@"diantai.png"] forState:UIControlStateNormal];
    _buttonOneOne.backgroundColor = [UIColor clearColor];
    [_buttonOneOne setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonOneOne.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonOneOne.titleLabel.font = [UIFont systemFontOfSize:14];
    _buttonOneOne.imageEdgeInsets = UIEdgeInsetsMake(0, 19, 20, 0);
    _buttonOneOne.titleEdgeInsets = UIEdgeInsetsMake(50, -33, 0, 10);
    _buttonOneOne.layer.masksToBounds = YES;
    _buttonOneOne.layer.cornerRadius = 10;
    [_mainScrollView addSubview:_buttonOneOne];
    
    _buttonOneTwo = [[UIButton alloc] initWithFrame:CGRectMake(200, 120, 80, 80)];
    [_buttonOneTwo setTitle:@"我的收藏" forState:UIControlStateNormal];
    [_buttonOneTwo setImage:[UIImage imageNamed:@"shoucang.png"] forState:UIControlStateNormal];
    _buttonOneTwo.backgroundColor = [UIColor clearColor];
    [_buttonOneTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonOneTwo.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonOneTwo.titleLabel.font = [UIFont systemFontOfSize:14];
    _buttonOneTwo.imageEdgeInsets = UIEdgeInsetsMake(0, 19, 20, 0);
    _buttonOneTwo.titleEdgeInsets = UIEdgeInsetsMake(50, -33, 0, 10);
    _buttonOneTwo.layer.masksToBounds = YES;
    _buttonOneTwo.layer.cornerRadius = 10;
    [_mainScrollView addSubview:_buttonOneTwo];
    
    _buttonOneThree = [[UIButton alloc] initWithFrame:CGRectMake(285, 120, 80, 80)];
    [_buttonOneThree setTitle:@"关注新歌" forState:UIControlStateNormal];
    [_buttonOneThree setImage:[UIImage imageNamed:@"xinge.png"] forState:UIControlStateNormal];
    _buttonOneThree.backgroundColor = [UIColor clearColor];
    [_buttonOneThree setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buttonOneThree.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonOneThree.titleLabel.font = [UIFont systemFontOfSize:14];
    _buttonOneThree.imageEdgeInsets = UIEdgeInsetsMake(0, 19, 20, 0);
    _buttonOneThree.titleEdgeInsets = UIEdgeInsetsMake(50, -33, 0, 10);
    _buttonOneThree.layer.masksToBounds = YES;
    _buttonOneThree.layer.cornerRadius = 10;
    [_mainScrollView addSubview:_buttonOneThree];
    
    
    
    _buttonTwoZero = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 390, 60)];
    [_buttonTwoZero setTitle:@"我的音乐" forState:UIControlStateNormal];
    [_buttonTwoZero setImage:[UIImage imageNamed:@"youjiantou.png"] forState:UIControlStateNormal];
    _buttonTwoZero.backgroundColor = [UIColor clearColor];
    [_buttonTwoZero setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _buttonTwoZero.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonTwoZero.titleLabel.font = [UIFont systemFontOfSize:19];
    _buttonTwoZero.imageEdgeInsets = UIEdgeInsetsMake(10, 360, 0, 0);
    _buttonTwoZero.titleEdgeInsets = UIEdgeInsetsMake(10, -20, 0, 300);
    _buttonTwoZero.layer.masksToBounds = YES;
    _buttonTwoZero.layer.cornerRadius = 30;
    [_subView addSubview:_buttonTwoZero];
    
    
    
    _firstScrollView = [[UIScrollView alloc] init];
    _firstScrollView.frame = CGRectMake(0, 60, 390, 160);
    _firstScrollView.pagingEnabled = NO;
    _firstScrollView.contentSize = CGSizeMake(390 * 2, 160);
    _firstScrollView.bounces = NO;
    _firstScrollView.showsHorizontalScrollIndicator = NO;
    _firstScrollView.showsHorizontalScrollIndicator = NO;
    _firstScrollView.backgroundColor = [UIColor whiteColor];
    _firstScrollView.delegate = self;
    _firstScrollView.tag = 200;
    [_subView addSubview:_firstScrollView];
    
    _buttonThreeZero = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 120, 160)];
    [_buttonThreeZero setImage:[UIImage imageNamed:@"threeZero.jpg"] forState:UIControlStateNormal];
    _buttonThreeZero.backgroundColor = [UIColor clearColor];
    _buttonThreeZero.layer.masksToBounds = YES;
    _buttonThreeZero.layer.cornerRadius = 10;
    [_firstScrollView addSubview:_buttonThreeZero];
    
    _buttonThreeOne = [[UIButton alloc] initWithFrame:CGRectMake(135, 0, 120, 160)];
    [_buttonThreeOne setImage:[UIImage imageNamed:@"threeOne.jpg"] forState:UIControlStateNormal];
    _buttonThreeOne.backgroundColor = [UIColor clearColor];
    _buttonThreeOne.layer.masksToBounds = YES;
    _buttonThreeOne.layer.cornerRadius = 10;
    [_firstScrollView addSubview:_buttonThreeOne];
    
    _buttonThreeTwo = [[UIButton alloc] initWithFrame:CGRectMake(265, 0, 120, 160)];
    [_buttonThreeTwo setImage:[UIImage imageNamed:@"threeTwo.jpg"] forState:UIControlStateNormal];
    _buttonThreeTwo.backgroundColor = [UIColor clearColor];
    _buttonThreeTwo.layer.masksToBounds = YES;
    _buttonThreeTwo.layer.cornerRadius = 10;
    [_firstScrollView addSubview:_buttonThreeTwo];
    
    _buttonThreeThree = [[UIButton alloc] initWithFrame:CGRectMake(395, 0, 120, 160)];
    [_buttonThreeThree setImage:[UIImage imageNamed:@"threeZero.jpg"] forState:UIControlStateNormal];
    _buttonThreeThree.backgroundColor = [UIColor clearColor];
    _buttonThreeThree.layer.masksToBounds = YES;
    _buttonThreeThree.layer.cornerRadius = 10;
    [_firstScrollView addSubview:_buttonThreeThree];
    
    _buttonThreeFour = [[UIButton alloc] initWithFrame:CGRectMake(525, 0, 120, 160)];
    [_buttonThreeFour setImage:[UIImage imageNamed:@"threeOne.jpg"] forState:UIControlStateNormal];
    _buttonThreeFour.backgroundColor = [UIColor clearColor];
    _buttonThreeFour.layer.masksToBounds = YES;
    _buttonThreeFour.layer.cornerRadius = 10;
    [_firstScrollView addSubview:_buttonThreeFour];
    
    _buttonThreeFive = [[UIButton alloc] initWithFrame:CGRectMake(655, 0, 120, 160)];
    [_buttonThreeFive setImage:[UIImage imageNamed:@"threeTwo.jpg"] forState:UIControlStateNormal];
    _buttonThreeFive.backgroundColor = [UIColor clearColor];
    _buttonThreeFive.layer.masksToBounds = YES;
    _buttonThreeFive.layer.cornerRadius = 10;
    [_firstScrollView addSubview:_buttonThreeFive];
    
    
    
    _buttonFourZero = [[UIButton alloc] initWithFrame:CGRectMake(0, 230, 390, 60)];
    [_buttonFourZero setTitle:@"最近播放" forState:UIControlStateNormal];
    [_buttonFourZero setImage:[UIImage imageNamed:@"youjiantou.png"] forState:UIControlStateNormal];
    _buttonFourZero.backgroundColor = [UIColor clearColor];
    [_buttonFourZero setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _buttonFourZero.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonFourZero.titleLabel.font = [UIFont systemFontOfSize:19];
    _buttonFourZero.imageEdgeInsets = UIEdgeInsetsMake(10, 360, 0, 0);
    _buttonFourZero.titleEdgeInsets = UIEdgeInsetsMake(10, -20, 0, 300);
    _buttonFourZero.layer.masksToBounds = YES;
    _buttonFourZero.layer.cornerRadius = 30;
    [_subView addSubview:_buttonFourZero];
    
    
    
    _buttonFiveZero = [[UIButton alloc] initWithFrame:CGRectMake(5, 290, 190, 65)];
    [_buttonFiveZero setImage:[UIImage imageNamed:@"fiveZero.jpg"] forState:UIControlStateNormal];
    _buttonFiveZero.backgroundColor = [UIColor clearColor];
    _buttonFiveZero.layer.masksToBounds = YES;
    _buttonFiveZero.layer.cornerRadius = 10;
    [_subView addSubview:_buttonFiveZero];
    
    _buttonFiveOne = [[UIButton alloc] initWithFrame:CGRectMake(195, 290, 190, 65)];
    [_buttonFiveOne setImage:[UIImage imageNamed:@"fiveOne.jpg"] forState:UIControlStateNormal];
    _buttonFiveOne.backgroundColor = [UIColor clearColor];
    _buttonFiveOne.layer.masksToBounds = YES;
    _buttonFiveOne.layer.cornerRadius = 10;
    [_subView addSubview:_buttonFiveOne];
    
    
    
    _buttonSixZero = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonSixZero  setFrame:CGRectMake(7, 385, 90, 20)];
    _buttonSixZero.showsTouchWhenHighlighted = YES;
    _buttonSixZero.selected = YES;
    [_buttonSixZero setTitle:@"创建歌单³" forState:UIControlStateNormal];
    _buttonSixZero.backgroundColor = [UIColor clearColor];
    [_buttonSixZero setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonSixZero setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    _buttonSixZero.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonSixZero.titleLabel.font = [UIFont systemFontOfSize:19];
    [_buttonSixZero addTarget:self action:@selector(buttonSixZeroPress) forControlEvents:UIControlEventTouchUpInside];
    _buttonSixZero.layer.masksToBounds = YES;
    _buttonSixZero.layer.cornerRadius = 10;
    [_subView addSubview:_buttonSixZero];
    
    _buttonSixOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buttonSixOne  setFrame:CGRectMake(100, 385, 90, 20)];
    _buttonSixOne.showsTouchWhenHighlighted = YES;
    _buttonSixOne.selected = NO;
    [_buttonSixOne setTitle:@"收藏歌单³" forState:UIControlStateNormal];
    _buttonSixOne.backgroundColor = [UIColor clearColor];
    [_buttonSixOne setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_buttonSixOne setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    _buttonSixOne.titleLabel.textAlignment = NSTextAlignmentCenter;
    _buttonSixOne.titleLabel.font = [UIFont systemFontOfSize:19];
    [_buttonSixOne addTarget:self action:@selector(buttonSixOnePress) forControlEvents:UIControlEventTouchUpInside];
    _buttonSixOne.layer.masksToBounds = YES;
    _buttonSixOne.layer.cornerRadius = 10;
    [_subView addSubview:_buttonSixOne];
    
    
    
    _secondScrollView = [[UIScrollView alloc] init];
    _secondScrollView.frame = CGRectMake(0, 415, 390, 140);
    _secondScrollView.pagingEnabled = YES;
    _secondScrollView.contentSize = CGSizeMake(390 * 2, 65);
    _secondScrollView.bounces = NO;
    _secondScrollView.showsHorizontalScrollIndicator = NO;
    _secondScrollView.showsHorizontalScrollIndicator = NO;
    _secondScrollView.backgroundColor = [UIColor whiteColor];
    _secondScrollView.delegate = self;
    _secondScrollView.tag = 300;
    [_subView addSubview:_secondScrollView];
    
    _buttonSevenZero = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 190, 65)];
    [_buttonSevenZero setImage:[UIImage imageNamed:@"sevenZero.jpg"] forState:UIControlStateNormal];
    _buttonSevenZero.backgroundColor = [UIColor clearColor];
    _buttonSevenZero.layer.masksToBounds = YES;
    _buttonSevenZero.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenZero];
    
    _buttonSevenOne = [[UIButton alloc] initWithFrame:CGRectMake(195, 0, 190, 65)];
    [_buttonSevenOne setImage:[UIImage imageNamed:@"sevenOne.jpg"] forState:UIControlStateNormal];
    _buttonSevenOne.backgroundColor = [UIColor clearColor];
    _buttonSevenOne.layer.masksToBounds = YES;
    _buttonSevenOne.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenOne];
    
    _buttonSevenTwo = [[UIButton alloc] initWithFrame:CGRectMake(5, 75, 190, 65)];
    [_buttonSevenTwo setImage:[UIImage imageNamed:@"sevenTwo.jpg"] forState:UIControlStateNormal];
    _buttonSevenTwo.backgroundColor = [UIColor clearColor];
    _buttonSevenTwo.layer.masksToBounds = YES;
    _buttonSevenTwo.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenTwo];
    
    _buttonSevenThree = [[UIButton alloc] initWithFrame:CGRectMake(195, 75, 190, 65)];
    [_buttonSevenThree setImage:[UIImage imageNamed:@"sevenThree.jpg"] forState:UIControlStateNormal];
    _buttonSevenThree.backgroundColor = [UIColor clearColor];
    _buttonSevenThree.layer.masksToBounds = YES;
    _buttonSevenThree.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenThree];
    
    _buttonSevenFour = [[UIButton alloc] initWithFrame:CGRectMake(395, 0, 190, 65)];
    [_buttonSevenFour setImage:[UIImage imageNamed:@"sevenZero.jpg"] forState:UIControlStateNormal];
    _buttonSevenFour.backgroundColor = [UIColor clearColor];
    _buttonSevenFour.layer.masksToBounds = YES;
    _buttonSevenFour.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenFour];
    
    _buttonSevenFive = [[UIButton alloc] initWithFrame:CGRectMake(585, 0, 190, 65)];
    [_buttonSevenFive setImage:[UIImage imageNamed:@"sevenOne.jpg"] forState:UIControlStateNormal];
    _buttonSevenFive.backgroundColor = [UIColor clearColor];
    _buttonSevenFive.layer.masksToBounds = YES;
    _buttonSevenFive.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenFive];
    
    _buttonSevenSix = [[UIButton alloc] initWithFrame:CGRectMake(395, 75, 190, 65)];
    [_buttonSevenSix setImage:[UIImage imageNamed:@"sevenTwo.jpg"] forState:UIControlStateNormal];
    _buttonSevenSix.backgroundColor = [UIColor clearColor];
    _buttonSevenSix.layer.masksToBounds = YES;
    _buttonSevenSix.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenSix];
    
    _buttonSevenSeven = [[UIButton alloc] initWithFrame:CGRectMake(585, 75, 190, 65)];
    [_buttonSevenSeven setImage:[UIImage imageNamed:@"sevenThree.jpg"] forState:UIControlStateNormal];
    _buttonSevenSeven.backgroundColor = [UIColor clearColor];
    _buttonSevenSeven.layer.masksToBounds = YES;
    _buttonSevenSeven.layer.cornerRadius = 10;
    [_secondScrollView addSubview:_buttonSevenSeven];
    
    [self.view addSubview:_mainScrollView];
}



- (void)buttonSixZeroPress {
    if (_buttonSixZero.selected == NO) {
        [_buttonSixZero setSelected:YES];
        [_buttonSixOne setSelected:NO];
        [_secondScrollView scrollRectToVisible:CGRectMake(0, 0, 390, 140) animated:YES];
    }
}

- (void)buttonSixOnePress {
    if (_buttonSixOne.selected == NO) {
        [_buttonSixZero setSelected:NO];
        [_buttonSixOne setSelected:YES];
        [_secondScrollView scrollRectToVisible:CGRectMake(390, 0, 390, 140) animated:YES];
    }
}



- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (scrollView.tag == 200) {
        if (_firstScrollView.contentOffset.x > 0 && _firstScrollView.contentOffset.x < 65)  {
            [_firstScrollView scrollRectToVisible:CGRectMake(0, 0, 390, 160) animated:YES];
        } else if (_firstScrollView.contentOffset.x > 65 && _firstScrollView.contentOffset.x < 195) {
            [_firstScrollView scrollRectToVisible:CGRectMake(130, 0, 390, 160) animated:YES];
        } else if (_firstScrollView.contentOffset.x > 195 && _firstScrollView.contentOffset.x < 325) {
            [_firstScrollView scrollRectToVisible:CGRectMake(260, 0, 390, 160) animated:YES];
        } else if (_firstScrollView.contentOffset.x > 325 && _firstScrollView.contentOffset.x < 455) {
            [_firstScrollView scrollRectToVisible:CGRectMake(390, 0, 390, 160) animated:YES];
        }
    }
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 200) {
        if (_firstScrollView.contentOffset.x > 0 && _firstScrollView.contentOffset.x < 65)  {
            [_firstScrollView scrollRectToVisible:CGRectMake(0, 0, 390, 160) animated:YES];
        } else if (_firstScrollView.contentOffset.x > 65 && _firstScrollView.contentOffset.x < 195) {
            [_firstScrollView scrollRectToVisible:CGRectMake(130, 0, 390, 160) animated:YES];
        } else if (_firstScrollView.contentOffset.x > 195 && _firstScrollView.contentOffset.x < 325) {
            [_firstScrollView scrollRectToVisible:CGRectMake(260, 0, 390, 160) animated:YES];
        } else if (_firstScrollView.contentOffset.x > 325 && _firstScrollView.contentOffset.x < 455) {
            [_firstScrollView scrollRectToVisible:CGRectMake(390, 0, 390, 160) animated:YES];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 300) {
        if(scrollView.contentOffset.x == 0) {
            [_buttonSixZero setSelected:YES];
            [_buttonSixOne setSelected:NO];
        } else {
            [_buttonSixZero setSelected:NO];
            [_buttonSixOne setSelected:YES];
        }
    }
}

- (void)pressLeft {
    _mineSubViewController = [[MineSubViewController alloc] init];
    [self.navigationController pushViewController:_mineSubViewController animated:YES];
}

- (void)pressRight {
    
}


@end
