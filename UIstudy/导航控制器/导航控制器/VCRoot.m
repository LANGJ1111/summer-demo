//
//  VCRoot.m
//  导航控制器
//
//  Created by 浪极 on 2021/7/19.
//

#import "VCRoot.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    //设置导航栏的标题文字
    self.title = @"根视图";
    //设置导航元素项目的标题
    self.navigationController.title = @"Title";
    //p1:按钮文字
    //p2:按钮风格
    //p3:事件拥有者
    //p4:按钮事件
    //根据文字创建
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithTitle:@"左侧" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    self.navigationItem.leftBarButtonItem = leftBtn;
    //p1:按钮风格
    //p2:事件拥有者
    //p3:按钮事件
    //根据系统风格创建
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressRight)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 40)];
    label.text = @"test";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    
    //将任何类型的控件添加到导航按钮的方法
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithCustomView:label];
    //创建按钮数组
    NSArray *arrayBtn = [NSArray arrayWithObjects:rightBtn, item3, nil];
    //将右侧按钮赋值
    self.navigationItem.rightBarButtonItems = arrayBtn;
}

- (void)pressLeft {
    NSLog(@"左侧按钮被按下！");
}

- (void)pressRight {
    NSLog(@"右侧按钮被按下！");
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
