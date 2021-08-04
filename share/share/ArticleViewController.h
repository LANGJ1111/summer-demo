//
//  ArticleViewController.h
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import <UIKit/UIKit.h>
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArticleViewController : UIViewController<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIButton *firstButton;
@property (nonatomic, strong)UIButton *secondButton;
@property (nonatomic, strong)UIButton *thirdButton;

@property (nonatomic, strong)UIScrollView *mainScrollView;
@property (nonatomic, strong)UITableView *firstTableView;
@property (nonatomic, strong)UITableView *secondTableView;
@property (nonatomic, strong)UITableView *thirdTableView;
@property FirstTableViewCell *firstCell;
@property SecondTableViewCell *secondCell;

@property (nonatomic, strong)NSMutableArray *firstText;
@property (nonatomic, strong)NSMutableArray *secondText;
@property (nonatomic, strong)NSMutableArray *thirdText;
@property (nonatomic, strong)NSMutableArray *fourthText;

@property (nonatomic, assign)int *zan_situation;
@property (nonatomic, assign)int *zan;
@property (nonatomic, assign)int *guanzhu;
@property (nonatomic, assign)int *share;

@end

NS_ASSUME_NONNULL_END
