//
//  ViewController.m
//  Slider&ProgressView
//
//  Created by 浪极 on 2021/7/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize slider = _slider;
@synthesize pView = _progressview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _progressview = [UIProgressView new];
    _progressview.frame = CGRectMake(50, 100, 200, 1000);           //进度条高度不变！
    _progressview.progressTintColor = [UIColor redColor];           //进度条颜色（默认蓝色）
    _progressview.trackTintColor = [UIColor blackColor];            //进度条右端颜色（默认灰色）
    _progressview.progress = 0.7;   //0-1
    _progressview.progressViewStyle = UIProgressViewStyleDefault;   //设置进度条风格特征
    //_progressview.progressViewStyle = UIProgressViewStyleBar;     //设置进度条风格特征
    [self.view addSubview:_progressview];
    
    _slider = [UISlider new];
    _slider.frame = CGRectMake(10, 200, 300, 40);   //高度不变！
    _slider.maximumValue = 100;
    _slider.minimumValue = -100;   //可以为负值！
    _slider.value = 50;         //float
    _slider.minimumTrackTintColor = [UIColor blueColor];    //blue
    _slider.maximumTrackTintColor = [UIColor greenColor];   //gray
    _slider.thumbTintColor = [UIColor orangeColor];         //white
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
}

- (void)pressSlider {
    _progressview.progress = (_slider.value - _slider.minimumValue) / (_slider.maximumValue - _slider.minimumValue);
    NSLog(@"value = %f", _slider.value);
}

@end
