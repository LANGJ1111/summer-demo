//
//  ViewControllerHome.m
//  Zara仿写
//
//  Created by 浪极 on 2021/7/20.
//

#import "ViewControllerHome.h"

@interface ViewControllerHome ()

@end

@implementation ViewControllerHome

//设置底部导航栏图标
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"tupian.png"];
    }
    return self;
}

//创建按钮
- (void)createButton {
    _buttonLeft = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonLeft.frame = CGRectMake(0, 420, 30, 30);
    [_buttonLeft setImage:[UIImage imageNamed:@"youjiantou.png"] forState:UIControlStateNormal];
    [_buttonLeft setImage:[UIImage imageNamed:@"youjiantou.png"] forState:UIControlStateHighlighted];
    [_buttonLeft addTarget:self action:@selector(leftTouch:) forControlEvents:UIControlEventTouchUpInside];
    _buttonLeft.tag = 101;
    [self.view addSubview:_buttonLeft];
    
    _buttonRight = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonRight.frame = CGRectMake(360, 420, 30, 30);
    [_buttonRight setImage:[UIImage imageNamed:@"zuojiantou.png"] forState:UIControlStateNormal];
    [_buttonRight setImage:[UIImage imageNamed:@"zuojiantou.png"] forState:UIControlStateHighlighted];
    [_buttonRight addTarget:self action:@selector(rightTouch:) forControlEvents:UIControlEventTouchUpInside];
    _buttonRight.tag = 102;
    [self.view addSubview:_buttonRight];
    
    _buttonHead = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonHead.frame = CGRectMake(0, 80, 390, 78);
    [_buttonHead setImage:[UIImage imageNamed:@"SONY_LOGO.jpeg"] forState:UIControlStateNormal];
    [_buttonHead setImage:[UIImage imageNamed:@"SONY_LOGO.jpeg"] forState:UIControlStateHighlighted];
    [_buttonHead addTarget:self action:@selector(headTouch:) forControlEvents:UIControlEventTouchUpInside];
    _buttonHead.tag = 103;
    [self.view addSubview:_buttonHead];
}

//左侧按钮动作
- (void)leftTouch:(UIButton *)button {
    if(_scrollView.contentOffset.x >= 390) {
        [_scrollView scrollRectToVisible:CGRectMake(390 * (int)(_scrollView.contentOffset.x / 390) - 390, _scrollView.contentOffset.y, 390, 455) animated:YES];
    }
}

//右侧按钮动作
- (void)rightTouch:(UIButton *)button {
    if(_scrollView.contentOffset.x <= 390 * 2) {
        [_scrollView scrollRectToVisible:CGRectMake(390 * (int)(_scrollView.contentOffset.x / 390) + 390, _scrollView.contentOffset.y, 390, 455) animated:YES];
    }
}

//顶部按钮动作
- (void)headTouch:(UIButton *)button {
    [_scrollView scrollRectToVisible:CGRectMake(0, 200, 390, 455) animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //滚动视图设置
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 200, 390, 455);
    //整页滚动
    _scrollView.pagingEnabled = YES;
    //画布大小
    _scrollView.contentSize = CGSizeMake(390 * 4, 455);
    //边缘弹动
    _scrollView.bounces = NO;
    //横向滚动条
    _scrollView.showsHorizontalScrollIndicator = YES;
    //纵向滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    //设置图片
    for (int i = 0; i < 4; i++) {
        NSString *strName = [NSString stringWithFormat:@"%d.jpg", i + 1];
        UIImage *image = [UIImage imageNamed:strName];
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        iView.frame = CGRectMake(390 * i, 0, 390, 455);
        [_scrollView addSubview:iView];
    }
    
    //设置代理
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    [self createButton];
}

@end
