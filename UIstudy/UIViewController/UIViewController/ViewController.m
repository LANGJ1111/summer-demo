//
//  ViewController.m
//  UIViewController
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController2 *vc = [[ViewController2 alloc] init];
    //p1:新的视图控制器对象
    //p2:使用动画切换动画效果
    //p3:切换结束后功能调用，不需要nil即可
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    NSLog(@"第一次加载视图");
}

//animated:是否加载动画
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"视图即将显示");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"视图即将消失");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"视图已经显示");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"视图已经消失");
}
@end
