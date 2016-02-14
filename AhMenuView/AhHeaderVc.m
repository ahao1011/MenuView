//
//  AhHeaderVc.m
//  AhMenuView
//
//  Created by ah on 16/2/3.
//  Copyright © 2016年 ah. All rights reserved.
//

#import "AhHeaderVc.h"
#import "Header.h"
#import "textVc.h"
#import "AhMenuView.h"
@interface AhHeaderVc ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)AhMenuView *menuView;

@end

@implementation AhHeaderVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.tableFooterView = [UIView new];
    
    
//    [self.view addSubview:self.menuView];
    
    
}

- (AhMenuView*)makeMenuView{
    
    textVc *vc1 = [[textVc alloc]init];
    vc1.title = @"服装";
    
    textVc *vc2 = [[textVc alloc]init];
    vc2.title = @"鞋子";
    
    textVc *vc3 = [[textVc alloc]init];
    vc3.title = @"开发者中心";
    
    textVc *vc4 = [[textVc alloc]init];
    vc4.title = @"装备";
    //
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
    
    // ,vc5,vc6,vc7,vc8,vc9,vc10
    _menuView = [[AhMenuView alloc]initWithVCNames:@[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10] frame:CGRectMake(3, 0, K_Screen_Width, K_Screen_Height-64) VCBlock:^(UIViewController *vc, NSInteger index) {
        
        NSLog(@"第%zd个控制器View=====控制器为:%@",index,vc);
    }];
    
    return _menuView;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"jh"];
    cell.backgroundColor= AHRandomColor;
    cell.userInteractionEnabled = YES;
    if (indexPath.section==1 && indexPath.row==0) {
        
        AhMenuView *menView = [self makeMenuView];
        [cell addSubview:menView];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.section];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==1) {
        return .1;
    }
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==1 && indexPath.row==0) {
        
        return K_Screen_Height-64-49;
    }
    return 44;
}


@end
