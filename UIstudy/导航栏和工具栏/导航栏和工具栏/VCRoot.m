//
//  VCRoot.m
//  导航栏和工具栏
//
//  Created by 浪极 on 2021/7/19.
//

#import "VCRoot.h"
#import "VCSecond.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //导航栏是否透明
    self.navigationController.navigationBar.translucent = NO;
    //设置导航栏颜色
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
    self.title = @"根视图";
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"右侧按钮" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = btn;
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.translucent = NO;
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(pressNext)];
    
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnImage setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    btnImage.frame = CGRectMake(0, 0, 60, 60);
    
    UIBarButtonItem *btn4 = [[UIBarButtonItem alloc] initWithCustomView:btnImage];
    //固定宽度占位按钮
    UIBarButtonItem *btnF1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    btnF1.width = 120;
    //自动计算宽度按钮
    UIBarButtonItem *btnF2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    NSArray *arrayBtns = [NSArray arrayWithObjects:btn1, btnF2, btn2, btnF2, btn3, nil];
    self.toolbarItems = arrayBtns;
}

- (void)pressNext {
    VCSecond *vc = [VCSecond new];
    [self.navigationController pushViewController:vc animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
