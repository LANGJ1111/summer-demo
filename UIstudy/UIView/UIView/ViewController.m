//
//  ViewController.m
//  UIView
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(100, 500, 100, 200);
    view.backgroundColor = [UIColor greenColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    //view.hidden = YES;    //是否隐藏视图对象，默认NO不隐藏
    view.alpha = 1;   //0为透明
    view.opaque = YES;   //是否显示不透明
    //[view removeFromSuperview];
    
    UIView *view1 = [UIView new];
    view1.frame = CGRectMake(100, 100, 150, 150);
    view1.backgroundColor = [UIColor blueColor];
    
    UIView *view2 = [UIView new];
    view2.frame = CGRectMake(125, 125, 150, 150);
    view2.backgroundColor = [UIColor orangeColor];
    
    UIView *view3 = [UIView new];
    view3.frame = CGRectMake(150, 150, 150, 150);
    view3.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    
    [self.view bringSubviewToFront:view1];
    [self.view sendSubviewToBack:view1];
    
    UIView *viewFront = self.view.subviews[2];
    UIView *viewBack = self.view.subviews[0];
    if(viewBack == view1) {
        NSLog(@"viewBack相等");
    }
    if(viewFront == view2) {
        NSLog(@"viewFront相等");
    }
}

@end
