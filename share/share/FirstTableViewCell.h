//
//  FirstTableViewCell.h
//  share
//
//  Created by 浪极 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell<UIScrollViewDelegate, UITableViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, retain)NSTimer *timer;

@end

NS_ASSUME_NONNULL_END
