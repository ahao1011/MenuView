//
//  textVc.m
//  Hd_JSHT
//
//  Created by ah on 16/2/3.
//  Copyright © 2016年 ah. All rights reserved.
//





#import "textVc.h"
#import "Header.h"

@interface textVc ()

@end

@implementation textVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = AHRandomColor;   //  随机色
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 30;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid = @"jj";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:cellid];;
    }
    cell.backgroundColor = AHRandomColor;
    return cell;
}

@end
