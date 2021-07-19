//
//  ViewController.m
//  手动布局子视图
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"
#import "SuperView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SuperView *sView = [SuperView new];
    sView.frame = CGRectMake(20, 20, 180, 280);
    [sView createSubViews];
    sView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:sView];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(240, 480, 80, 40);
    [btn1 setTitle:@"放大" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(pressLarge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(240, 520, 80, 40);
    [btn2 setTitle:@"缩小" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(pressSmall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    sView.tag = 101;
}

- (void)pressLarge {
    SuperView *sView = (SuperView *)[self.view viewWithTag:101];
    sView.frame = CGRectMake(20, 20, 300, 480);
}

- (void)pressSmall {
    SuperView *sView = (SuperView *)[self.view viewWithTag:101];
    sView.frame = CGRectMake(20, 20, 180, 280);
}
@end
