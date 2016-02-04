//
//  AhMenuView.h
//  Hd_JSHT
//
//  Created by ah on 15/12/7.
//  Copyright © 2015年 ah. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AhMenuView : UIView

@property (nonatomic,strong)UIScrollView *topscrView;
@property (nonatomic,strong)UIScrollView *scrView;

- (instancetype)initWithVCNames:(NSArray*)VcArr frame:(CGRect)frame VCBlock:(void(^)(UIViewController *vc, NSInteger index))vcBlock;


@end
