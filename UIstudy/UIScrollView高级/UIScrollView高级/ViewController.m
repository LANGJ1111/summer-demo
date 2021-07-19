//
//  ViewController.m
//  UIScrollView高级
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
    
    _scrollView = [UIScrollView new];
    _scrollView.frame = CGRectMake(10, 50, 300, 400);
    _scrollView.bounces = NO;
    //滚动视图是否响应事件
    _scrollView.userInteractionEnabled = YES;
    _scrollView.contentSize = CGSizeMake(300, 400 * 9);
    
    for (int i = 0; i < 9; i++) {
        NSString *strName = [NSString stringWithFormat:@"%d.jpeg", i + 1];
        UIImage *image = [UIImage imageNamed:strName];
        UIImageView *iView = [UIImageView new];
        iView.image = image;
        iView.frame = CGRectMake(0, 400 * i, 300, 400);
        
        [_scrollView addSubview:iView];
    }
    
    [self.view addSubview:_scrollView];
    //按页滚动效果
    _scrollView.pagingEnabled = NO;
    
    _scrollView.contentOffset = CGPointMake(0, 0);
    //将当前视图控制器作为代理对象
    _scrollView.delegate = self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _scrollView.contentOffset = CGPointMake(0, 0);
    //[_scrollView scrollRectToVisible:CGRectMake(0, 0, 300, 400) animated:YES];
}
//视图offset坐标变化
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"y = %f", scrollView.contentOffset.y);
}
//视图即将开始拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"Did End Drag!");
}
//视图即将开始被拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"Will Begin Drag!");
}
//视图即将结束拖动
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"Will End Drag!");
}
//视图即将减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Will Begin Decelerate!");
}
//视图停止瞬间
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"视图停止移动！");
}

@end
