//
//  ViewController.m
//  自动布局子视图
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
    _superView = [UIView new];
    _superView.frame = CGRectMake(20, 20, 180, 280);
    _superView.backgroundColor = [UIColor blueColor];
    
    _label1 = [UILabel new];
    _label1.frame = CGRectMake(0, 0, 40, 40);
    _label1.text = @"1";
    _label1.backgroundColor = [UIColor greenColor];
    
    _label2 = [UILabel new];
    _label2.frame = CGRectMake(180 - 40, 0, 40, 40);
    _label2.text = @"2";
    _label2.backgroundColor = [UIColor greenColor];
    
    _label3 = [UILabel new];
    _label3.frame = CGRectMake(180 - 40, 280 - 40, 40, 40);
    _label3.text = @"3";
    _label3.backgroundColor = [UIColor greenColor];
    
    _label4 = [UILabel new];
    _label4.frame = CGRectMake(0, 280 - 40, 40, 40);
    _label4.text = @"4";
    _label4.backgroundColor = [UIColor greenColor];
    
    [_superView addSubview:_label1];
    [_superView addSubview:_label2];
    [_superView addSubview:_label3];
    [_superView addSubview:_label4];
    [self.view addSubview:_superView];
    
    _viewCenter = [UIView new];
    _viewCenter.frame = CGRectMake(0, 0, _superView.bounds.size.width, 40);
    _viewCenter.center = CGPointMake(180 / 2, 280 / 2);
    _viewCenter.backgroundColor = [UIColor orangeColor];
    
    [_superView addSubview:_viewCenter];
    
    //UIViewAutoresizingFlexibleHeight      自动调整高度
    //UIViewAutoresizingFlexibleWidth       自动调整宽度
    //UIViewAutoresizingFlexibleLeftMargin  调整与superView左边的距离（保持右边不变）
    //UIViewAutoresizingFlexibleRightMargin 调整与superView右边的距离（保持左边不变）
    //UIViewAutoresizingFlexibleTopMargin   调整与superView顶部的距离（保持底部不变）
    //UIViewAutoresizingFlexibleBottomMargin调整与superView底部的距离（保持顶部不变）
    _label2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    _label3.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    _label4.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    _viewCenter.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static BOOL isLarge = NO;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    if(isLarge == NO) {
        _superView.frame = CGRectMake(10, 10, 300, 480);
    }else {
        _superView.frame = CGRectMake(10, 10, 180, 280);
    }
    [UIView commitAnimations];
    isLarge = !isLarge;
}

@end
