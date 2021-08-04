//
//  SubHomeViewController.m
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import "SubHomeViewController.h"


@interface SubHomeViewController ()

@end

@implementation SubHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 390, 750)];
    scrollView.contentSize = CGSizeMake(390, 1198);
    scrollView.backgroundColor = [UIColor whiteColor];
    UIImageView *first =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subHome_first.jpg"]];
    first.frame = CGRectMake(0, 0, 390, 561);
    [scrollView addSubview:first];
    UIImageView *second =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subHome_second.png"]];
    second.frame = CGRectMake(0, 561, 390, 637);
    [scrollView addSubview:second];
    [self.view addSubview:scrollView];
    
    _firstButton = [[UIButton alloc] init];
    _firstButton.frame = CGRectMake(205, 45, 60, 30);
    [_firstButton setTitle:[NSString stringWithFormat:@"%d", _zan] forState:UIControlStateNormal];
    [_firstButton setTitle:[NSString stringWithFormat:@"%d", _zan + 1] forState:UIControlStateSelected];
    [_firstButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_firstButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateSelected];
    if (_zanIsSelected == YES) {
        _firstButton.selected = YES;
    }
    _firstButton.backgroundColor = [UIColor clearColor];
    _firstButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _firstButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_firstButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _firstButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _firstButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    [_firstButton addTarget:self action:@selector(pressFirst:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:_firstButton];
    
    _secondButton = [[UIButton alloc] init];
    _secondButton.frame = CGRectMake(265, 45, 60, 30);
    [_secondButton setTitle:[NSString stringWithFormat:@"%d", _guanzhu] forState:UIControlStateNormal];
    [_secondButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    [_secondButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateSelected];
    _secondButton.backgroundColor = [UIColor clearColor];
    _secondButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _secondButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_secondButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _secondButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _secondButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    [_secondButton addTarget:self action:@selector(pressSecond:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:_secondButton];
    
    _thirdButton = [[UIButton alloc] init];
    _thirdButton.frame = CGRectMake(325, 45, 60, 30);
    [_thirdButton setTitle:[NSString stringWithFormat:@"%d", _share] forState:UIControlStateNormal];
    [_thirdButton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    [_thirdButton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateSelected];
    _thirdButton.backgroundColor = [UIColor clearColor];
    _thirdButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _thirdButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_thirdButton setTitleColor:[UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1] forState:UIControlStateNormal];
    _thirdButton.imageEdgeInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    _thirdButton.titleEdgeInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    [_thirdButton addTarget:self action:@selector(pressThird:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:_thirdButton];
}

- (void)pressFirst:(UIButton *)button {
    if (button.selected) {
        button.selected = NO;
        _zan--;
        [button setTitle:[NSString stringWithFormat:@"%d", _zan] forState:UIControlStateNormal];
        _zanIsSelected = NO;
    } else {
        button.selected = YES;
        _zan++;
        [button setTitle:[NSString stringWithFormat:@"%d", _zan] forState:UIControlStateNormal];
        _zanIsSelected = YES;
    }
}

- (void)pressSecond:(UIButton *)button {
    _guanzhu++;
    [button setTitle:[NSString stringWithFormat:@"%d", _guanzhu] forState:UIControlStateNormal];
}

- (void)pressThird:(UIButton *)button {
    _share++;
    [button setTitle:[NSString stringWithFormat:@"%d", _share] forState:UIControlStateNormal];
}

- (void)viewWillDisappear:(BOOL)animated {
    _backBlock(_zan, _guanzhu, _share);
}

@end
