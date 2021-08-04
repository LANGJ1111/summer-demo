//
//  SubSettingSearchViewController.m
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import "SubSettingSearchViewController.h"
#import "SettingSearchViewController.h"

@interface SubSettingSearchViewController ()

@end

@implementation SubSettingSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _imageSelected = malloc(sizeof(int) * 24);
    for (int i = 0; i < 24; i++) {
        _imageSelected[i] = 0;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStyleDone target:self action:@selector(pressRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    for (int i = 0; i < 6; i ++) {
        for (int j = 0; j < 4; j++) {
            UIButton *button = [[UIButton alloc] init];
            button.frame = CGRectMake(j * 100, i * 100, 90, 90);
            [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"touxiang%d.jpg", i * 4 + j + 1]] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateSelected];
            button.imageEdgeInsets = UIEdgeInsetsMake(-35, 35, 35, -35);
            button.tag = 300 + i * 4 + j;
            [self.view addSubview:button];
        }
    }
}

- (void)pressButton:(UIButton *)button {
    if (button.selected == NO) {
        button.selected = YES;
        _imageSelected[button.tag - 300] = 1;
    } else {
        button.selected = NO;
        _imageSelected[button.tag - 300] = 0;
    }
}

- (void)pressRightButton {
    int imageCount = 0;
    int imageFirst = 0;
    int temp = 1;
    for (int i = 0; i < 24; i++) {
        if (_imageSelected[i]) {
            imageCount++;
            if (temp) {
                imageFirst = i;
                temp = 0;
            }
        }
    }
    [self.delegate choosePhoto:imageFirst andNumber:imageCount];
    NSLog(@"%d", imageFirst);
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
