//
//  ViewController.m
//  UITableView
//
//  Created by 浪极 on 2021/7/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //设置代理
    _tableView.delegate = self;
    //设置数据源
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

//必须要实现的！！！
//获取每组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
//数据视图组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

//创建单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellStr = @"cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellStr];
    if(cell == nil) {
        //创建单元格对象
        //p1:单元格样式
        //p2:单元格的复用标记
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    NSString *str = [NSString stringWithFormat:@"第%ld组，第%ld行！", indexPath.section, indexPath.row];
    cell.textLabel.text = str;
    
    return cell;
}

@end
