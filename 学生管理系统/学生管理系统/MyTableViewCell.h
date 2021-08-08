//
//  MyTableViewCell.h
//  学生管理系统
//
//  Created by 浪极 on 2021/8/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell

@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *classLabel;
@property(nonatomic, strong) UILabel *gradeLabel;

- (void)transfer:(NSIndexPath *)indexPath nameArray:(NSMutableArray *)nameArray classArray:(NSMutableArray *)classArray andGradeArray:(NSMutableArray *)gradeArray;

@end

NS_ASSUME_NONNULL_END
