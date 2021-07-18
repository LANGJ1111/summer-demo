//
//  ViewController.m
//  定时器和视图对象
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize timerView = _timerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btnStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnStart.frame = CGRectMake(100, 100, 80, 40);
    [btnStart setTitle:@"启动定时器" forState:UIControlStateNormal];
    [btnStart addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnStart];
    
    UIButton *btnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnStop.frame = CGRectMake(100, 200, 80, 40);
    [btnStop setTitle:@"停止定时器" forState:UIControlStateNormal];
    [btnStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnStop];
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, 80, 80);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    view.tag = 101;
}

- (void)pressStart {
    //p1:隔多少秒调用定时器函数
    //p2:实现定时器函数的对象
    //p3:定时器函数对象
    //p4:可以传入一个参数
    //p5:是否重复操作
    _timerView = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer:) userInfo:@"张三" repeats:YES];
}

- (void)updateTimer:(NSTimer *)timer {
    NSLog(@"%@", timer.userInfo);
    UIView *view = [self.view viewWithTag:101];
    view.frame = CGRectMake(view.frame.origin.x + 0.2, view.frame.origin.y + 0.2, 80, 80);
}

- (void)pressStop {
    if(_timerView != nil) {
        [_timerView invalidate];
    }
}
@end
