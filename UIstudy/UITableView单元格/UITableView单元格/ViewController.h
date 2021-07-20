//
//  ViewController.h
//  UITableView单元格
//
//  Created by 浪极 on 2021/7/20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
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

