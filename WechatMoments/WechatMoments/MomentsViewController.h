//
//  MomentsViewController.h
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MomentsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIBarButtonItem *barButtonItem;

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *firstTextName;
@property (nonatomic, strong)NSMutableArray *firstTextText;
@property (nonatomic, strong)NSMutableArray *firstTextTime;
@property (nonatomic, strong)NSMutableArray *secondTextName;
@property (nonatomic, strong)NSMutableArray *secondTextTime;
@property (nonatomic, strong)NSMutableArray *secondTextText;

@end

NS_ASSUME_NONNULL_END
