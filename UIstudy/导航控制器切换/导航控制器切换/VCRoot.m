//
//  VCRoot.m
//  导航控制器切换
//
//  Created by 浪极 on 2021/7/19.
//

#import "VCRoot.h"
#import "VCSecond.h"
#import "VCThird.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //导航栏是否透明
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationController.navigationBar.translucent = NO;
    //设置导航栏风格
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.title = @"根视图";
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"下一级" style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    self.navigationItem.rightBarButtonItem = next;
}

- (void)pressNext {
    //创建新的导航控制器
    VCSecond *vcSecond = [VCSecond new];
    //使用当前视图控制器的导航控制器对象
    [self.navigationController pushViewController:vcSecond animated:YES];
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
