//
//  AddViewController.m
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import "AddViewController.h"

@interface AddViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@end

@implementation AddViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backview.jpeg"]];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 110)];
    headView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:headView];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 355, 20)];
    tipLabel.font = [UIFont systemFontOfSize:15];
    tipLabel.text = @"请输入城市名称";
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:tipLabel];
    
    _searchTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, 300, 40)];
    _searchTextFiled.backgroundColor = [UIColor whiteColor];
    [_searchTextFiled addTarget:self action:@selector(textFiledChange) forControlEvents:UIControlEventEditingChanged];
    _searchTextFiled.delegate = self;
    [headView addSubview:_searchTextFiled];
    
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(325, 70, 50, 40)];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(pressCancel) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:cancelButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 120, 300, 320) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    _tableView.alwaysBounceHorizontal = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    _searchArray = [NSMutableArray array];
    _nowArray = [NSMutableArray array];
}

#pragma mark pressCancel
- (void)pressCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - textFiled
- (void)textFiledChange {
    if (_searchTextFiled.text != nil) {
        [_searchArray removeAllObjects];
        [self creatPost];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - creatPost
- (void)creatPost {
    NSString *urlString = [NSString stringWithFormat:@"https://geoapi.heweather.net/v2/city/lookup?location=%@&key=081a92d66f5f4262b5abdcd01d9d068c", _searchTextFiled.text];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        if (error == nil) {
            id objc = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *basic = objc[@"location"];
            for(int i = 0; i < basic.count; i++) {
                NSMutableArray *name = basic[i][@"name"];
                [self->_searchArray addObject:name];
            }

            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
        }
    }];
    [dataTask resume];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_searchArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if ([_searchArray count] != 0) {
        cell.textLabel.text = _searchArray[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate presscontent:_searchArray[indexPath.row]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
