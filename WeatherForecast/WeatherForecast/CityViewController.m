//
//  CityViewController.m
//  WeatherForecast
//
//  Created by 浪极 on 2021/9/2.
//

#import "CityViewController.h"
#import "ForecastTableViewCell.h"
#import "TodayTableViewCell.h"

@interface CityViewController ()

@end

@implementation CityViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backview.jpeg"]];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 630)];
    _mainScrollView.contentSize = CGSizeMake([_cityArray count] * 375, 650);
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.delegate = self;
    _mainScrollView.bounces = NO;
    _mainScrollView.alwaysBounceHorizontal = NO;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    [_mainScrollView setContentOffset:CGPointMake(_page * 375, 0)];
    [self.view addSubview:_mainScrollView];
     
    for (int i = 0; i < [_cityArray count]; i++) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(375 * i, 0, 375, 630) style:UITableViewStyleGrouped];
        tableView.tag = i;
        [tableView registerClass:[ForecastTableViewCell class] forCellReuseIdentifier:@"forecast"];
        [tableView registerClass:[TodayTableViewCell class] forCellReuseIdentifier:@"today"];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        [self creatPost:_cityArray[i] tableView:tableView];
        [_mainScrollView addSubview:tableView];
    }

    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(300, 630, 50, 40)];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    _detailsMenuTodayArray = [NSMutableArray arrayWithObjects:@"日出", @"日落", @"空气质量", @"湿度", @"风速等级", @"风速", @"体感温度", @"气压", @"能见度", @"夜间天气", nil];
    _detailsTodaytArray = [NSMutableArray array];
    _forecastArray = [NSMutableArray array];
    _headViewArray = [NSMutableArray array];
    _hourlyArray = [NSMutableArray array];
    _weeklyWeatherImageArray = [NSMutableArray array];
}

#pragma mark - tableView
- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark dataSource in tableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    } else {
        return 70;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
         return 6;
     } else {
         if (section == 1) {
             return 1;
         } else {
             return 5;
         }
     }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 410;
    } else {
        return 0;
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    #pragma mark headView in tableView
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 410)];
    
    UIScrollView *smallScrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 280, 375, 130)];
    smallScrollerView.contentSize = CGSizeMake(630, 130);
    [headView addSubview:smallScrollerView];

    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, 375, 50)];
    cityLabel.font = [UIFont systemFontOfSize:45];
    cityLabel.textAlignment = NSTextAlignmentCenter;
    cityLabel.textColor = [UIColor whiteColor];
    [headView addSubview:cityLabel];
    
    UILabel *weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, 375, 20)];
    weatherLabel.font = [UIFont systemFontOfSize:17];
    weatherLabel.textAlignment = NSTextAlignmentCenter;
    weatherLabel.textColor = [UIColor whiteColor];
    [headView addSubview:weatherLabel];
    
    UILabel *temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 140, 375, 80)];
    temperatureLabel.font = [UIFont systemFontOfSize:60];
    temperatureLabel.textAlignment = NSTextAlignmentCenter;
    temperatureLabel.textColor = [UIColor whiteColor];
    [headView addSubview:temperatureLabel];
    
    UILabel *todayLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 230, 130, 30)];
    todayLabel.font = [UIFont systemFontOfSize:15];
    todayLabel.textColor = [UIColor whiteColor];
    [headView addSubview:todayLabel];
    
    UILabel *maxlabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 230, 50, 25)];
    maxlabel.font = [UIFont systemFontOfSize:20];
    maxlabel.textAlignment = NSTextAlignmentCenter;
    maxlabel.textColor = [UIColor whiteColor];
    [headView addSubview:maxlabel];
    
    UILabel *minLabel = [[UILabel alloc] initWithFrame:CGRectMake(315, 230, 50, 25)];
    minLabel.font = [UIFont systemFontOfSize:20];
    minLabel.textAlignment = NSTextAlignmentCenter;
    minLabel.textColor = [UIColor whiteColor];
    [headView addSubview:minLabel];
    
    int j;
    if ([_headViewArray count] != 0) {
        for (j = 0; j < [_cityArray count]; j++) {
            if ([_headViewArray[j][5] isEqualToString:_cityArray[tableView.tag]]) {
                break;
           }
       }
       cityLabel.text = _headViewArray[j][5];
       weatherLabel.text = _headViewArray[j][0];
       temperatureLabel.text = _headViewArray[j][1];
       todayLabel.text = _headViewArray[j][2];
       maxlabel.text = _headViewArray[j][3];
       minLabel.text = _headViewArray[j][4];
       [self.delegate nowcontent: _headViewArray[j][1]];
   }

    UILabel *hourWeatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 62.5, 20)];
    hourWeatherLabel.textAlignment = NSTextAlignmentCenter;
    hourWeatherLabel.textColor = [UIColor whiteColor];
    [smallScrollerView addSubview:hourWeatherLabel];
    
    UIImageView *weatherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 35, 30, 40)];
    [smallScrollerView addSubview:weatherImageView];
    
    UILabel *hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 62.5, 20)];
    hourLabel.textAlignment = NSTextAlignmentCenter;
    hourLabel.textColor = [UIColor whiteColor];
    hourLabel.text = @"现在";
    [smallScrollerView addSubview:hourLabel];
    
    if ([_headViewArray count] != 0) {
        for (j = 0; j < [_cityArray count]; j++) {
            if ([_headViewArray[j][5] isEqualToString:_cityArray[tableView.tag]]) {
                break;
            }
        }
        weatherImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", _hourlyArray[j][0][@"wea_img"]]];
        hourWeatherLabel.text = _headViewArray[j][1];
    }

    for (int i = 1; i < 10; i++) {
        UILabel *hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(62.5 * i, 10, 62.5, 20)];
        hourLabel.textAlignment = NSTextAlignmentCenter;
        hourLabel.textColor = [UIColor whiteColor];
        
        UIImageView *weatherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(62.5 * i + 15, 35, 30, 40)];
        
       UILabel *hourWeatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(62.5 * i, 80, 62.5, 20)];
        hourWeatherLabel.textAlignment = NSTextAlignmentCenter;
        hourWeatherLabel.textColor = [UIColor whiteColor];
        
        if ([_headViewArray count] != 0) {
            for (j = 0; j < [_cityArray count]; j++) {
                if ([_headViewArray[j][5] isEqualToString:_cityArray[tableView.tag]]) {
                    break;
                }
            }
            hourWeatherLabel.text = _hourlyArray[j][i - 1][@"tem"];
            weatherImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", _hourlyArray[j][i - 1][@"wea_img"]]];
            hourLabel.text = _hourlyArray[j][i - 1][@"hours"];
        }
        [smallScrollerView addSubview:hourLabel];
        [smallScrollerView addSubview:weatherImageView];
        [smallScrollerView addSubview:hourWeatherLabel];
    }

    headView.backgroundColor = [UIColor clearColor];
    return headView;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    #pragma mark cell in tableView
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
       cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    if (_headViewArray.count != 0) {
        NSInteger j;
        for (j = 0; j < [_cityArray count]; j++) {
            if ([_headViewArray[j][5] isEqualToString:_cityArray[tableView.tag]]) {
                break;
            }
        }
        if (indexPath.section == 0) {
            ForecastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"forecast" forIndexPath:indexPath];
            cell.dataLabel.text = _forecastArray[0][indexPath.row * 3];
            cell.maxLabel.text = _forecastArray[0][indexPath.row * 3 + 1];
            cell.minLabel.text = _forecastArray[0][indexPath.row * 3 + 2];
            cell.weatherImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", _weeklyWeatherImageArray[0][indexPath.row]]];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        } else {
            if (indexPath.section == 2) {
                TodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"today" forIndexPath:indexPath];
                
                cell.titleLabel.text = _detailsMenuTodayArray[indexPath.row * 2];
                cell.titleproLabel.text = _detailsMenuTodayArray[indexPath.row * 2 + 1];
                if ([_headViewArray count] != 0) {
                    for (j = 0; j < [_cityArray count]; j++) {
                       if ([_headViewArray[j][5] isEqualToString:_cityArray[tableView.tag]]) {
                           break;
                       }
                    }
                }
                cell.contentLabel.text = _detailsTodaytArray[j][indexPath.row * 2];
                cell.contentproLabel.text = _detailsTodaytArray[j][indexPath.row * 2 + 1];
                cell.backgroundColor = [UIColor clearColor];
                return cell;
            } else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lifeStyleCell"];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"lifeStyleCell"];
                }
                cell.textLabel.text = [NSString stringWithFormat:@"今日%@，当前气温%@，最高气温%@。", _headViewArray[j][0], _headViewArray[j][1], _headViewArray[j][4]];
                cell.backgroundColor = [UIColor clearColor];
                cell.textLabel.font = [UIFont systemFontOfSize:16];
                cell.textLabel.textColor = [UIColor whiteColor];
                return cell;
            }
        }
        return cell;
    }
    return cell;
}

#pragma mark - creatPost
- (void)creatPost: (NSString*)str tableView:(UITableView *)tableView {
    NSString *str0 = [NSString stringWithFormat:@"https://yiketianqi.com/api?version=v9&appid=21253683&appsecret=0LXrEm6Y&city=%@", str];
    str0 = [str0 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:str0];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSMutableArray *hourlyArray = [NSMutableArray arrayWithObjects:dic[@"data"][0][@"wea"],dic[@"data"][0][@"tem"],dic[@"data"][0][@"day"],dic[@"data"][0][@"tem1"],dic[@"data"][0][@"tem2"],str, nil];
        [self->_headViewArray addObject:hourlyArray];
        [self.hourlyArray addObject:dic[@"data"][0][@"hours"]];
            
        NSMutableArray *forecastArray = [NSMutableArray arrayWithObjects:dic[@"data"][1][@"week"],dic[@"data"][1][@"tem1"],dic[@"data"][1][@"tem2"],dic[@"data"][2][@"week"],dic[@"data"][1][@"tem1"],dic[@"data"][3][@"tem2"],dic[@"data"][3][@"week"],dic[@"data"][3][@"tem1"],dic[@"data"][3][@"tem2"],dic[@"data"][4][@"week"],dic[@"data"][4][@"tem1"],dic[@"data"][4][@"tem2"],dic[@"data"][5][@"week"],dic[@"data"][5][@"tem1"],dic[@"data"][5][@"tem2"],dic[@"data"][6][@"week"],dic[@"data"][6][@"tem1"],dic[@"data"][6][@"tem2"],nil];
        [self.forecastArray addObject:forecastArray];
        
         NSMutableArray *detailsTodaytArray = [NSMutableArray arrayWithObjects:dic[@"data"][0][@"sunrise"],dic[@"data"][0][@"sunset"],dic[@"data"][0][@"air"],dic[@"data"][0][@"humidity"],dic[@"data"][0][@"win_speed"],dic[@"data"][0][@"win_meter"],dic[@"data"][0][@"tem"],dic[@"data"][0][@"pressure"],dic[@"data"][0][@"visibility"],dic[@"data"][0][@"wea_day"],nil];
        [self.detailsTodaytArray addObject:detailsTodaytArray];
        
        NSMutableArray *weeklyWeatherImageArray = [NSMutableArray arrayWithObjects:dic[@"data"][1][@"wea_day_img"],dic[@"data"][2][@"wea_day_img"],dic[@"data"][3][@"wea_day_img"],dic[@"data"][4][@"wea_day_img"],dic[@"data"][5][@"wea_day_img"],dic[@"data"][6][@"wea_day_img"],nil];
        [self.weeklyWeatherImageArray addObject:weeklyWeatherImageArray];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [tableView reloadData];
            }];
    }];
    [dataTask resume];
}

@end
