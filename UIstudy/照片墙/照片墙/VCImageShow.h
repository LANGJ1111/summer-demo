//
//  VCImageShow.h
//  照片墙
//
//  Created by 浪极 on 2021/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCImageShow : UIViewController

@property(nonatomic, assign)NSUInteger imageTag;
@property(nonatomic, retain)UIImage *image;
@property(nonatomic, retain)UIImageView *imageView;

@end

NS_ASSUME_NONNULL_END
