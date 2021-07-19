//
//  ViewController.m
//  步进器和分栏控件
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize stepper = _stepper;
@synthesize segControl = _segControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _stepper = [UIStepper new];
    _stepper.frame = CGRectMake(100, 100, 80, 40);  //宽高不可变！
    _stepper.minimumValue = 0;
    _stepper.maximumValue = 100;
    _stepper.value = 10;
    _stepper.stepValue = 1; //步进值
    _stepper.autorepeat = YES;  //是否可以重复响应事件操作（长按）
    _stepper.continuous = YES;  //是否将步进结果通过事件函数响应出来（有中间过程）
    [_stepper addTarget:self action:@selector(stepChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_stepper];
    
    _segControl = [UISegmentedControl new];
    _segControl.frame = CGRectMake(10, 200, 300, 40);
    //p1:按钮文字
    //p2:按钮索引位置
    //p3:是否有插入动画
    [_segControl insertSegmentWithTitle:@"0元" atIndex:0 animated:NO];
    [_segControl insertSegmentWithTitle:@"5元" atIndex:1 animated:NO];
    [_segControl insertSegmentWithTitle:@"10元" atIndex:2 animated:NO];

    //默认索引按钮
    _segControl.selectedSegmentIndex = 0;
    [_segControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segControl];
}

- (void)segChange {
    NSLog(@"%d", _segControl.selectedSegmentIndex);
}

- (void)stepChange {
    NSLog(@"step press value = %f", _stepper.value);
}


@end
