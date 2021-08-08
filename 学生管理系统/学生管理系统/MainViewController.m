//
//  MainViewController.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/4.
//

#import "MainViewController.h"
#import "MyTableViewCell.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SearchViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"main.jpg"];
    [self.view addSubview:imageView];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,100, 390, 400) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"my"];
    [self.view addSubview:_tableView];
                
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, 394, 40)];
    label.text = @"      姓名                班级                   成绩";
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:20];
   [self.view addSubview:label];

    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addButton.frame = CGRectMake(80, 550, 100, 50);
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:20];
    addButton.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    addButton.layer.masksToBounds = YES;
    addButton.layer.cornerRadius = 25;
    [addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];

    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    deleteButton.frame = CGRectMake(220, 550, 100, 50);
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:20];
    deleteButton.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    deleteButton.layer.masksToBounds = YES;
    deleteButton.layer.cornerRadius = 25;
    [deleteButton addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];

    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    changeButton.frame = CGRectMake(80, 630, 100, 50);
    [changeButton setTitle:@"修改" forState:UIControlStateNormal];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:20];
    changeButton.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    changeButton.layer.masksToBounds = YES;
    changeButton.layer.cornerRadius = 25;
    [changeButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    findButton.frame = CGRectMake(220, 630, 100, 50);
    [findButton setTitle:@"查找" forState:UIControlStateNormal];
    findButton.titleLabel.font = [UIFont systemFontOfSize:20];
    findButton.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    findButton.layer.masksToBounds = YES;
    findButton.layer.cornerRadius = 25;
    [findButton addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findButton];
    
    UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    exitButton.frame = CGRectMake(270, 740, 100, 50);
    [exitButton setTitle:@"exit" forState:UIControlStateNormal];
    exitButton.titleLabel.font = [UIFont systemFontOfSize:20];
    exitButton.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    exitButton.layer.masksToBounds = YES;
    exitButton.layer.cornerRadius = 25;
    [exitButton addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitButton];
                
                
    _nameArray = [NSMutableArray arrayWithObjects:@"Aaa", @"Billy", @"Csgo", @"Damn", @"Error", @"Fail", @"Group", @"Hahaha", nil];
    _gradeArray = [NSMutableArray arrayWithObjects:@"80", @"100", @"1", @"59", @"30", @"0", @"77", @"66", nil];
    _classArray = [NSMutableArray arrayWithObjects:@"一班", @"二班", @"一班", @"三班", @"四班", @"三班", @"二班", @"四班", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _nameArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"my" forIndexPath:indexPath];
    [cell transfer:indexPath nameArray:_nameArray classArray:_classArray andGradeArray:_gradeArray];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)exit {
    exit(0);
}
- (void)add {
    AddViewController *add = [[AddViewController alloc] init];
    add.nameArray = _nameArray;
    add.classArray = _classArray;
    add.gradeArray = _gradeArray;
    add.addDelegate = self;
    add.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:add animated:YES completion:nil];

}

- (void)addReloadWithNameArray:(NSMutableArray *)nameArray classArray:(NSMutableArray *)classArray andGradeArray:(NSMutableArray *)gradeArray {
    [_nameArray addObject:nameArray];
    [_classArray addObject:classArray];
    [_gradeArray addObject:gradeArray];
    [_tableView reloadData];
}

- (void)delete {
    DeleteViewController *delete = [[DeleteViewController alloc] init];
    delete.nameArray = _nameArray;
    delete.classArray = _classArray;
    delete.gradeArray = _gradeArray;
    delete.delegate = self;
    delete.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:delete animated:YES completion:nil];
    
}
//删除协议函数的实现方法 重新加载一遍里面的数值
- (void)deleteReloadWithNameArray:(NSMutableArray *)nameArray classArray:(NSMutableArray *)classArray andGradeArray:(NSMutableArray *)gradeArray {
    _nameArray = nameArray;
    _classArray = classArray;
    _gradeArray = gradeArray;
    [_tableView reloadData];
}

- (void)change {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入要修改的学生姓名" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *nameField = alert.textFields.firstObject;
            int i = 0;
            for(i = 0; i < self->_nameArray.count; i++) {
                if([nameField.text isEqualToString:self->_nameArray[i]]) {
                        break;
                }
            }
            if(i == self->_nameArray.count) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未找到该学生" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alert addAction:sure];
                [self presentViewController:alert animated:NO completion:nil];
            } else {
                ChangeViewController *change = [[ChangeViewController alloc] init];
                change.modalPresentationStyle = UIModalPresentationFullScreen;
                change.changeDelegate = self;
                change.number = i;
                change.nameArray = self->_nameArray;
                change.classArray = self->_classArray;
                change.gradeArray = self->_gradeArray;
                change.modalPresentationStyle = UIModalPresentationFullScreen;
                [self presentViewController:change animated:YES completion:nil];
            }
        }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];

    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入学生姓名";
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)changeReloadWithNameArray:(NSMutableArray *)nameArray classArray:(NSMutableArray *)classArray andGradeArray:(NSMutableArray *)gradeArray {
    _nameArray = nameArray;
    _classArray = classArray;
    _gradeArray = gradeArray;
    [_tableView reloadData];
}

- (void)search {
    SearchViewController *search = [[SearchViewController alloc] init];
    search.nameArray = _nameArray;
    search.classArray = _classArray;
    search.gradeArray = _gradeArray;
    search.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:search animated:YES completion:nil];
}

@end
