//
//  FirstTableViewCell.m
//  share
//
//  Created by 浪极 on 2021/7/27.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if([self.reuseIdentifier isEqualToString:@"first"]) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 0, 390, 220);
        _scrollView.contentSize = CGSizeMake(390 * 6, 220);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.tag = 200;
        _scrollView.delegate = self;
        
        for (int i = 1; i <= 4; i++) {
            NSString *imageName = [NSString stringWithFormat:@"main_img%d.png", i];
            UIImage *image = [UIImage imageNamed:imageName];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(390 * i, 0, 390, 220);
            [_scrollView addSubview:imageView];
        }
        UIImageView *firstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_img4.png"]];
        firstImageView.frame = CGRectMake(0, 0, 390, 220);
        [_scrollView addSubview:firstImageView];
        UIImageView *lastImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_img1.png"]];
        lastImageView.frame = CGRectMake(390 * 5, 0, 390, 220);
        [_scrollView addSubview:lastImageView];
        _scrollView.contentOffset = CGPointMake(390, 0);
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoRepeat) userInfo:nil repeats:YES];
        
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)autoRepeat {
    if (_scrollView.contentOffset.x == 390 * 5) {
        _scrollView.contentOffset = CGPointMake(390, 0);
    }
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.contentOffset.x + 390, 0, 390, 220) animated:YES];
}
////视图停止
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    if (scrollView.tag == 200) {
//        if (scrollView.contentOffset.x >= 390 * 4) {
//            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x - 390 * 4, 0);
//        } else if (scrollView.contentOffset.x <= 390) {
//            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + 390 * 4, 0);
//        }
//    }
//}
//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView.tag == 200) {
        [_timer invalidate];
        _timer = nil;
    }
}

//结束拖拽
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (scrollView.contentOffset.x > 390 * 4) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x - 390 * 4, 0);
    } else if (scrollView.contentOffset.x < 390) {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x + 390 * 4, 0);
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoRepeat) userInfo:nil repeats:YES];
}

//每组单元格尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

//每组单元格尾部设置
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

//每组单元格尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

//每组单元格尾部设置
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

@end
