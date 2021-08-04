//
//  SettingSearchViewController.m
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import "SettingSearchViewController.h"
#import "SubSettingSearchViewController.h"

@interface SettingSearchViewController ()

@end

@implementation SettingSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.935 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    _imageButton = [[UIButton alloc] init];
    _imageButton.frame = CGRectMake(45, 15, 160, 160);
    [_imageButton setBackgroundImage:[UIImage imageNamed:@"xuanzetupian.png"] forState:UIControlStateNormal];
    [_imageButton addTarget:self action:@selector(pressImageButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_imageButton];
    
    _numberLabel = [[UILabel alloc] init];
    _numberLabel.frame = CGRectMake(195, 15, 15, 15);
    _numberLabel.text = @"0";
    _numberLabel.textColor = [UIColor redColor];
    [self.view addSubview: _numberLabel];
    
    UIImageView *weizhi = [[UIImageView alloc] init];
    weizhi.frame = CGRectMake(230, 70, 130, 41);
    weizhi.image = [UIImage imageNamed:@"weizhi.png"];
    [self.view addSubview:weizhi];
    
    NSArray *firstArray = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(15 + 92.5 * i, 180, 82.5, 30);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:firstArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    NSArray *secondArray = [NSArray arrayWithObjects:@"虚拟与设计", @"影视", @"摄影", @"其他", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(15 + 92.5 * i, 220, 82.5, 30);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:secondArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(15, 270, 360, 40);
    textField.font = [UIFont systemFontOfSize:17];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"作品名称";
    [self.view addSubview:textField];
    
    UILabel *labelDescribtion = [[UILabel alloc] init];
    labelDescribtion.frame = CGRectMake(15, 320, 360, 30);
    labelDescribtion.text = @"作品说明";
    labelDescribtion.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:labelDescribtion];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(15, 360, 360, 200);
    textView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:textView];
    
    UIButton *publish = [[UIButton alloc] init];
    publish.frame = CGRectMake(15, 570, 360, 50);
    [publish setTitle:@"发布" forState:UIControlStateNormal];
    publish.titleLabel.font = [UIFont systemFontOfSize:25];
    publish.backgroundColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    publish.layer.masksToBounds = YES;
    publish.layer.cornerRadius = 5;
    [publish addTarget:self action:@selector(pressPublish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: publish];
    
    UIButton *download = [[UIButton alloc] init];
    download.frame = CGRectMake(15, 633, 15, 15);
    [download setImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [download setImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateSelected];
    [download addTarget:self action:@selector(pressDownload:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:download];
    
    UILabel *labelDownload = [[UILabel alloc] init];
    labelDownload.frame = CGRectMake(30, 630, 100, 20);
    labelDownload.text = @"禁止下载";
    labelDownload.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:labelDownload];
}

- (void)pressImageButton {
    SubSettingSearchViewController *subSettingSearchViewController = [[SubSettingSearchViewController alloc] init];
    subSettingSearchViewController.delegate = self;
    [self.navigationController pushViewController:subSettingSearchViewController animated:YES];
}

- (void)buttonPress:(UIButton *)button {
    if (button.selected == YES) {
        button.selected = NO;
        button.backgroundColor = [UIColor whiteColor];
    } else {
        button.selected = YES;
        button.backgroundColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)pressDownload:(UIButton *)button {
    if (button.selected == YES) {
        button.selected = NO;
    } else {
        button.selected = YES;
    }
}

- (void)pressPublish {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"发布成功！" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self.navigationController popViewControllerAnimated:YES];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)choosePhoto:(int)numberOfTouxiang andNumber:(NSInteger)numberOfPhotos {
    if (numberOfPhotos > 0) {
        [_imageButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"touxiang%d.jpg", numberOfTouxiang + 1]] forState:UIControlStateNormal];
        NSLog(@"%d", numberOfTouxiang);
    }
    _numberLabel.text = [NSString stringWithFormat:@"%ld", numberOfPhotos];
}

@end
