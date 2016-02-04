//
//  ViewController.m
//  AhMenuView
//
//  Created by ah on 16/2/3.
//  Copyright © 2016年 ah. All rights reserved.
//

//4. 屏幕宽 高
#define K_Screen_Width [UIScreen mainScreen].bounds.size.width
#define K_Screen_Height [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "textVc.h"
#import "AhMenuView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self menuTest];
}

- (void)menuTest{
    
    
    textVc *vc1 = [[textVc alloc]init];
    vc1.title = @"服装";
    
    textVc *vc2 = [[textVc alloc]init];
    vc2.title = @"鞋子";
    
    textVc *vc3 = [[textVc alloc]init];
    vc3.title = @"开发者中心";
    
    textVc *vc4 = [[textVc alloc]init];
    vc4.title = @"装备";
    
    textVc *vc5 = [[textVc alloc]init];
    vc5.title = @"仓库";
    
    textVc *vc6 = [[textVc alloc]init];
    vc6.title = @"会员中心";
    textVc *vc7 = [[textVc alloc]init];
    vc7.title = @"更多";
    textVc *vc8 = [[textVc alloc]init];
    vc8.title = @"更多";
    textVc *vc9 = [[textVc alloc]init];
    vc9.title = @"更多";
    textVc *vc10 = [[textVc alloc]init];
    vc10.title = @"更多";
    
    
    AhMenuView *menview = [[AhMenuView alloc]initWithVCNames:@[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10] frame:CGRectMake(0, 64, K_Screen_Width, K_Screen_Height-64-49) VCBlock:^(UIViewController *vc, NSInteger index) {
        
        NSLog(@"第%zd个控制器View=====控制器为:%@",index,vc);
    }];
    
    [self.view addSubview:menview];
    
    
    
    
}


@end
