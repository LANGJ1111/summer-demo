//
//  TuiJianViewController.h
//  share
//
//  Created by 浪极 on 2021/7/31.
//

#import <UIKit/UIKit.h>
#import "SecondTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface TuiJianViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property(nonatomic, strong)UITableView *tableView;
@property SecondTableViewCell *secondCell;

@property (nonatomic, strong)NSMutableArray *firstText;
@property (nonatomic, strong)NSMutableArray *secondText;
@property (nonatomic, strong)NSMutableArray *thirdText;
@property (nonatomic, strong)NSMutableArray *fourthText;

@property (nonatomic, assign)int *zan;
@property (nonatomic, assign)int *guanzhu;
@property (nonatomic, assign)int *share;

@end

NS_ASSUME_NONNULL_END
