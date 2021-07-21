//
//  ViewControllerSetting.h
//  Zara仿写
//
//  Created by 浪极 on 2021/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerSetting : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    //单元格
    UITableView *_tableView;
    //数据源
    NSMutableArray *_arrayData;
    //图片源
    NSMutableArray *_imageData;
    //添加导航按钮
    UIBarButtonItem *_btnEdit;
    UIBarButtonItem *_btnFinish;
    UIBarButtonItem *_btnDelete;
}

@end

NS_ASSUME_NONNULL_END
