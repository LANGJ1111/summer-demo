//
//  ViewController.h
//  UITableView协议
//
//  Created by 浪极 on 2021/7/19.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITabBarDelegate> {
    UITableView *_tableView;
    NSMutableArray *_arrayData;
}


@end

