//
//  ViewController.h
//  UITableView高级协议
//
//  Created by 浪极 on 2021/7/19.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    //数据视图
    UITableView *_tableView;
    //数据源
    NSMutableArray *_arrayData;
    //添加导航按钮
    UIBarButtonItem *_btnEdit;
    UIBarButtonItem *_btnFinish;
    UIBarButtonItem *_btnDelete;
    //设置编辑状态
    BOOL _isEdit;
}


@end

