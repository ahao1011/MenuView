//
//  AhMenuView.h
//  Hd_JSHT
//
//  Created by ah on 15/12/7.
//  Copyright © 2015年 ah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^mennuViewBlock)(UIViewController *vc, NSInteger index);

@interface AhMenuView : UIView


@property (nonatomic,copy)mennuViewBlock block ;


@property (nonatomic ,strong)NSArray  *VcArr;  // 控制器数组



- (instancetype)initWithVCNames:(NSArray*)VcArr frame:(CGRect)frame VCBlock:(void(^)(UIViewController *vc, NSInteger index))vcBlock;


@end
