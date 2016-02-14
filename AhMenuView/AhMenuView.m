//
//  AhMenuView.m
//  Hd_JSHT
//
//  Created by ah on 15/12/7.
//  Copyright © 2015年 ah. All rights reserved.
//
#define K_MARGN 10


#define K_topBackColor  [UIColor whiteColor]   // 底部菜单栏颜色
#define K_BoomBackColor AHColor(232, 232, 232) // 滚动条的背景色
#define K_NormalColor   AHColor(56, 44, 36)    // button正常时的颜色
#define K_selColor      AHColor(33, 132, 252)  // button选中时的颜色





#import "AhMenuView.h"
#import "Header.h"

@interface AhMenuView ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *topscrView;
@property (nonatomic,strong)UIScrollView *BoomView;
@property (nonatomic,strong)UIView *BoomLine;
@property (nonatomic,strong)UIScrollView *scrView;
//@property (nonatomic,copy)mennuViewBlock block ;
//
//
//@property (nonatomic ,strong)NSArray  *VcArr;  // 控制器数组
@property (nonatomic ,strong)NSArray  *BtnArr;  // 控制器数组

@end

@implementation AhMenuView{
    
    CGFloat maxX; //
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addsubViews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
       
        [self addsubViews];
    }
    return self;
}

- (instancetype)initWithVCNames:(NSArray*)VcArr frame:(CGRect)frame VCBlock:(void(^)(UIViewController *vc, NSInteger index))vcBlock{
    _VcArr = VcArr;
    if (vcBlock) {
       _block = vcBlock;
    }
    return [self initWithFrame:frame];
}

- (void)addsubViews{
    
    
     _BtnArr = @[].mutableCopy;
    
    //  topscrView
    UIScrollView *topView = [[UIScrollView alloc]init];
    topView.showsHorizontalScrollIndicator = NO;
    topView.showsVerticalScrollIndicator = NO;
    topView.delegate = self;
    topView.scrollEnabled = NO;
    [self addSubview:topView];
    self.topscrView = topView;
    //  BoomView
    UIScrollView *BoomView = [[UIScrollView alloc]init];
    BoomView.delegate = self;
    BoomView.scrollEnabled = NO;
    BoomView.showsHorizontalScrollIndicator = NO;
    BoomView.showsVerticalScrollIndicator = NO;
    [self addSubview:BoomView];
    self.BoomView = BoomView;
    
    // scrView
    UIScrollView *scrView = [[UIScrollView alloc]init];
    scrView.delegate = self;
    scrView.pagingEnabled = YES;
    scrView.showsHorizontalScrollIndicator = NO;
    scrView.showsVerticalScrollIndicator = NO;
    [self addSubview:scrView];
    self.scrView = scrView;
}

- (void)layoutSubviews{
    
    //  topscrView
    CGFloat topX = 0;
    CGFloat topY = 0;
    CGFloat topW = self.frame.size.width;
    CGFloat topH = 30; // top高度
    self.topscrView.frame = CGRectMake(topX, topY, topW, topH);
    self.topscrView.backgroundColor = K_topBackColor;
    
//    MYLog(@"顶部滚动条Frame:%@",NSStringFromCGRect(self.topscrView.frame));
    
     //  BoomView
    CGFloat BoomX = 0;
    CGFloat BoomY = CGRectGetHeight(self.topscrView.frame) + topY;
    CGFloat BoomW = self.frame.size.width;
    CGFloat BoomH = 2 ; // BoomView高度
    self.BoomView.frame = CGRectMake(BoomX, BoomY, BoomW, BoomH);
    self.BoomView.backgroundColor = K_BoomBackColor;
    
//    MYLog(@"顶部滚动条下边的线条背景Frame:%@",NSStringFromCGRect(self.BoomView.frame));
    
    //scrView
    CGFloat scrViewX = 0;
    CGFloat scrViewY = CGRectGetHeight(self.BoomView.frame) + BoomY;
    CGFloat scrViewW = self.frame.size.width;
    CGFloat scrViewH = CGRectGetHeight(self.frame)- CGRectGetMaxY(self.BoomView.frame);
    
    self.scrView.frame = CGRectMake(scrViewX, scrViewY, scrViewW, scrViewH);
    
    [self addChildrenView];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#define K_FontNum 15
#define K_BtnFont [UIFont systemFontOfSize:K_FontNum]

- (void)addChildrenView{
    
    
//     MYLog(@"菜单栏添加的标题数量:%zd",self.VcArr.count);
    
    // boomline
    _BoomLine= [[UIView alloc]init];
    [self.BoomView addSubview:self.BoomLine];
    
    //  topscrView
    CGFloat btnY = 0;
    CGFloat btnH = self.topscrView.frame.size.height;
    maxX=0;
    for (int i = 0; i < self.VcArr.count; i++) {
        
        CGFloat btnW = self.frame.size.width/self.VcArr.count;
        UIViewController *vc = _VcArr[i];
        NSString *title = vc.title;
        if (self.VcArr.count>4) {
            CGSize size = [self sizeWithText:title font:K_BtnFont maxSize:CGSizeMake(MAXFLOAT, btnH)];
            btnW = size.width+10;
        }
        CGFloat btnX=maxX;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX+K_MARGN, btnY, btnW, btnH)];
        btn.layer.cornerRadius = 3.0f;
        btn.layer.masksToBounds = YES;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        maxX = CGRectGetMaxX(btn.frame);
//        MYLog(@"按钮的frame:%d====%@",i,NSStringFromCGRect(btn.frame));
        [btn setTitleColor:K_NormalColor forState:UIControlStateNormal];
        [btn setTitleColor:K_selColor forState:UIControlStateSelected];
        btn.tag = 1000 + i;
        [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.topscrView addSubview:btn];
        btn.titleLabel.font = K_BtnFont;
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateSelected];
        vc.view.frame = CGRectMake(i * CGRectGetWidth(self.scrView.frame), 0, CGRectGetWidth(self.scrView.frame), CGRectGetHeight(self.scrView.frame));
        [self.scrView addSubview:vc.view];
        
        if (i==0) {  //  设置初始状态
            btn.selected = YES;
            self.BoomLine.frame = CGRectMake(btn.frame.origin.x, 0, btn.frame.size.width, self.BoomView.frame.size.height);
            self.BoomLine.backgroundColor = [UIColor blueColor];
            if (_block) {  // block块
                _block(vc,0);
            }
        }
    }
    self.scrView.contentSize = CGSizeMake(CGRectGetWidth(self.scrView.frame) * self.VcArr.count, 0);
    self.topscrView.contentSize = CGSizeMake(maxX, 0);
    self.BoomView.contentSize = CGSizeMake(maxX, 0);
}

- (void)BtnClick:(UIButton *)sender{
    
    [self removeBtnAble];
    sender.selected = YES;
    UIButton *btn = (id)[self.topscrView viewWithTag:sender.tag];
    NSInteger index = sender.tag-1000;
    [self.scrView setContentOffset:CGPointMake(CGRectGetWidth(self.scrView.frame)*index, 0) animated:YES];
    
    [self CreatAnimate:btn index:index];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView==self.scrView) {
        
        NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
        UIButton *btn = (id)[self.topscrView viewWithTag:1000+index];
        [self removeBtnAble];
        btn.selected = YES;
        [self CreatAnimate:btn index:index];
    }
}
/** 移除按钮的选定状态 */
- (void)removeBtnAble{
    
    for (UIButton *aBtn in self.topscrView.subviews) {
        
        if ([aBtn isKindOfClass:[UIButton class]]) {
            aBtn.selected = NO;
        }
    }
}

- (void)CreatAnimate:(UIButton *)btn index:(NSInteger)index{
    
    
    [UIView animateWithDuration:.3f animations:^{
        
        self.BoomLine.frame = CGRectMake(btn.frame.origin.x, 0, btn.frame.size.width, CGRectGetHeight(self.BoomLine.frame));
        
        if ((CGRectGetMaxX(btn.frame)+K_MARGN)>= (self.topscrView.contentOffset.x+self.frame.size.width)) {\
            UIButton *NewBtn = (id)[self.topscrView viewWithTag:btn.tag+1];
            if (NewBtn) {
                CGFloat x = CGRectGetMaxX(NewBtn.frame)-self.frame.size.width;
                [self.topscrView setContentOffset:CGPointMake(x, 0) animated:YES];
                [self.BoomView setContentOffset:CGPointMake(x, 0) animated:YES];
            }
        }
        
        if ((btn.frame.origin.x-K_MARGN)<=self.topscrView.contentOffset.x) {

            UIButton *NewBtn = (id)[self.topscrView viewWithTag:btn.tag-1];
            if (NewBtn) {
                
                CGFloat x = NewBtn.frame.origin.x;
                [self.topscrView setContentOffset:CGPointMake(x, 0) animated:YES];
                [self.BoomView setContentOffset:CGPointMake(x, 0) animated:YES];
            }
            
        }
//        MYLog(@"第%zd个按钮====frame:%@",btn.tag-1000,NSStringFromCGRect(btn.frame));
//        MYLog(@"线条Frame:%@",NSStringFromCGRect(self.BoomLine.frame));
    }];
    UIViewController *vc = self.VcArr[index];
    if (_block) {
        _block(vc,index);
    }
}


@end
