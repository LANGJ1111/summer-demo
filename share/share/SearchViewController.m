//
//  SearchViewController.m
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import "SearchViewController.h"
#import "SubSearchViewController.h"
#import "SettingSearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"sousuo.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"SEARCH";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:24], NSFontAttributeName, nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.167 green:0.48 blue:0.75 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"radio_button_note.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rightPress)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 390, 844)];
    view.backgroundColor = [UIColor colorWithWhite:0.935 alpha:1];
    [self.view addSubview:view];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 50, 360, 40)];
    _textField.font = [UIFont systemFontOfSize:18];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.placeholder = @"搜索 用户名 作品分类 文章";
    [view addSubview:_textField];
    
    UIButton *searchButton = [[UIButton alloc] initWithFrame:CGRectMake(340, 55, 30, 30)];
    [searchButton setImage:[UIImage imageNamed:@"search_button"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    UIImageView *fenlei = [[UIImageView alloc] initWithFrame:CGRectMake(15, 130, 360, 26.5)];
    fenlei.image = [UIImage imageNamed:@"fenlei.png"];
    [self.view addSubview:fenlei];
    UIImageView *tuijian = [[UIImageView alloc] initWithFrame:CGRectMake(15, 270, 360, 26.5)];
    tuijian.image = [UIImage imageNamed:@"tuijian.png"];
    [self.view addSubview:tuijian];
    UIImageView *shijian = [[UIImageView alloc] initWithFrame:CGRectMake(15, 370, 360, 26.5)];
    shijian.image = [UIImage imageNamed:@"shijian.png"];
    [self.view addSubview:shijian];
    
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
    
    NSArray *thirdArray = [NSArray arrayWithObjects:@"人气最高", @"收藏最多", @"评论最多", @"编辑精选", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(15 + 92.5 * i, 320, 82.5, 30);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:thirdArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    NSArray *fourthArray = [NSArray arrayWithObjects:@"30分钟前", @"1小时前", @"1月前", @"1年前", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(15 + 92.5 * i, 420, 82.5, 30);
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:fourthArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)rightPress {
    SettingSearchViewController *settingSearchViewController =
    [[SettingSearchViewController alloc] init];
    [self.navigationController pushViewController:settingSearchViewController animated:YES];
}

- (void)searchPress {
    [self.view endEditing:YES];
    if ([_textField.text isEqualToString:@"1"]) {
        SubSearchViewController *subSearchViewController = [[SubSearchViewController alloc] init];
        [self.navigationController pushViewController:subSearchViewController animated:YES];
    }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
