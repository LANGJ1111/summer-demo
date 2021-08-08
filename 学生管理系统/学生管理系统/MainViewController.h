//
//  MainViewController.h
//  学生管理系统
//
//  Created by 浪极 on 2021/8/4.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"
#import "SearchViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, AddDelegate, DeleteDelegate, ChangeDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;

@end

NS_ASSUME_NONNULL_END
