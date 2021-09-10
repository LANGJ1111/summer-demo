//
//  MainViewController.m
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import "MainViewController.h"
#import "CityViewController.h"
#import "AddViewController.h"
#import "MyTableViewCell.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, AddViewControllerDelegate>

@end

@implementation MainViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backview.jpeg"]];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"my"];
    [self.view addSubview:_tableView];

    _addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_addButton setFrame:CGRectMake(330, 600, 50, 50)];
    [_addButton setImage:[UIImage imageNamed:@"tianjia.png"] forState:UIControlStateNormal];
    _addButton.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
    [_addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addButton];
    
    _temperatureArray = [[NSMutableArray alloc] init];
    _cityArray = [[NSMutableArray alloc] init];
    [_cityArray addObject:@"西安"];
    for(int i = 0; i < _cityArray.count; i++) {
        [self creatPost:_cityArray[i]];
    }
}

#pragma mark - creatPost
- (void)creatPost: (NSString*)str {
    NSString *str0 = [NSString stringWithFormat:@"https://yiketianqi.com/api?version=v9&appid=21253683&appsecret=0LXrEm6Y&city=%@", str];
    str0 = [str0 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:str0];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        [self->_temperatureArray addObject:dic[@"data"][0][@"tem"]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.tableView reloadData];
        }];
    }];
    [dataTask resume];
}

#pragma mark add
- (void)add {
    AddViewController *addViewController = [[AddViewController alloc] init];
    addViewController.delegate = self;
    addViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:addViewController animated:YES completion:nil];
}

#pragma mark presscontent:
- (void)presscontent:(NSMutableArray *)array {
    [_cityArray addObject:array];
    [self creatPost: _cityArray[[_cityArray count] - 1]];
    [_tableView reloadData];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cityArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([_temperatureArray count] != [_cityArray count]) {
        return 0;
    } else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"my" forIndexPath:indexPath];
    cell.cityLabel.text = _cityArray[indexPath.row];
    cell.temperatureLabel.text = _temperatureArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CityViewController *cityViewController = [[CityViewController alloc] init];
    cityViewController.cityArray = [NSMutableArray array];
    cityViewController.cityArray = _cityArray;
    cityViewController.page = indexPath.row;
    cityViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:cityViewController animated:YES completion:nil];
}

@end
