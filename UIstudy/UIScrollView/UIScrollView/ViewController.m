//
//  ViewController.m
//  UIScrollView
//
//  Created by 浪极 on 2021/7/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *sv = [UIScrollView new];
    sv.frame = CGRectMake(0, 0, 390, 844);
    //是否可以按照整页来滚动视图
    sv.pagingEnabled = YES;
    //是否可以开启滚动效果
    sv.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大于Frame
    sv.contentSize = CGSizeMake(390 * 5, 844);
    //是否可以边缘弹动效果
    sv.bounces = NO;
    //开启横向弹动效果
    sv.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    sv.alwaysBounceVertical = YES;
    //显示横向滚动条
    sv.showsHorizontalScrollIndicator = YES;
    //显示纵向滚动条
    sv.showsHorizontalScrollIndicator = YES;
    //sv.backgroundColor = [UIColor yellowColor];
    
    for (int i = 0; i < 3; i++) {
        NSString *strName = [NSString stringWithFormat:@"%d.jpg", i + 1];
        UIImage *image = [UIImage imageNamed:strName];
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        iView.frame = CGRectMake(390 * i, 0, 390, 844);
        [sv addSubview:iView];
    }
    
    [self.view addSubview:sv];
}


@end
