//
//  SingingViewController.m
//  网易云
//
//  Created by 浪极 on 2021/7/21.
//

#import "SingingViewController.h"

@interface SingingViewController ()

@end

@implementation SingingViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"singing.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"K歌";
    
    _labelOne = [[UILabel alloc] init];
    _labelOne.text = @"您的账号等级不够";
    _labelOne.textAlignment = NSTextAlignmentCenter;
    _labelOne.font = [UIFont systemFontOfSize:20];
    _labelOne.frame = CGRectMake(0, 350, 390, 50);
    _labelOne.textColor = [UIColor redColor];
    _labelTwo = [[UILabel alloc] init];
    _labelTwo.text = @"该功能暂未解锁!";
    _labelTwo.textAlignment = NSTextAlignmentCenter;
    _labelTwo.font = [UIFont systemFontOfSize:30];
    _labelTwo.frame = CGRectMake(0, 450, 390, 50);
    _labelTwo.textColor = [UIColor redColor];
    _labelThree = [[UILabel alloc] init];
    _labelThree.text = @"🔒";
    _labelThree.textAlignment = NSTextAlignmentCenter;
    _labelThree.font = [UIFont systemFontOfSize:60];
    _labelThree.frame = CGRectMake(0, 400, 390, 50);
    
    [self.view addSubview:_labelOne];
    [self.view addSubview:_labelTwo];
    [self.view addSubview:_labelThree];
}

@end
