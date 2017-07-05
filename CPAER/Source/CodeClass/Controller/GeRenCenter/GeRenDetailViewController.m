//
//  GeRenDetailViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/6/27.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "GeRenDetailViewController.h"
#import "CAPSPageMenu.h"

@interface GeRenDetailViewController ()
@property (nonatomic) CAPSPageMenu *pageMenu;

@end

@implementation GeRenDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    KuaiJiTableViewController *kuaiJiVC = [[KuaiJiTableViewController alloc] initWithNibName:@"KuaiJiTableViewController" bundle:nil];
    kuaiJiVC.title = @"会计";
    ShenJiTableViewController *shenJiVC = [[ShenJiTableViewController alloc] initWithNibName:@"ShenJiTableViewController" bundle:nil];
    shenJiVC.title = @"审计";
    CaiGuanTableViewController *caiGuanVC = [[CaiGuanTableViewController alloc] initWithNibName:@"CaiGuanTableViewController" bundle:nil];
    caiGuanVC.title = @"财管";
    ShuiFaTableViewController *shuiFaVC = [[ShuiFaTableViewController alloc] initWithNibName:@"ShuiFaTableViewController" bundle:nil];
    shuiFaVC.title = @"税法";
    JingJiFaTableViewController *jingJiFaVC = [[JingJiFaTableViewController alloc] initWithNibName:@"JingJiFaTableViewController" bundle:nil];
    jingJiFaVC.title = @"经济法";
    ZhanLueTableViewController *zhanLueVC = [[ZhanLueTableViewController alloc] initWithNibName:@"ZhanLueTableViewController" bundle:nil];
    zhanLueVC.title = @"战略";
    
    NSArray *controllerArray = @[kuaiJiVC, shenJiVC, caiGuanVC, shuiFaVC, jingJiFaVC, zhanLueVC];
    NSDictionary *parameters = @{
                                 //头部背景色
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                                 //未知？？？
//                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 //头部选中标签底部线条颜色
                                 CAPSPageMenuOptionSelectionIndicatorColor: Color_BaseColor,
                                 //头部整个底部线条的颜色
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0],
                                 //未知？？？
//                                 CAPSPageMenuOptionMenuItemSeparatorColor: [UIColor redColor],
                                 //头部选中标签的颜色
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor: Color_BaseColor,
                                 //头部选未中标签的颜色
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor: [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0],
//                                 CAPSPageMenuOptionUseMenuLikeSegmentedControl: [UIColor redColor],
                                 
                                 //头部标签字体大小
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:13.0 * PxWidth7P],
                                 //头部高度
                                 CAPSPageMenuOptionMenuHeight: @(40.0 * PxWidth7P),
                                 //相邻选中标签底部横线的距离
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0 * PxWidth7P),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0;
//}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//
        return  160 * PxHeight7P;
    }else if (indexPath.row == 1){//
        return 40 * PxHeight7P;
    }else if (indexPath.row == 2){//
        return (736 - 64 - 160 - 40 - 49) * PxHeight7P;
    }
    return 0;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.row == 0) {//
        IdentCell = @"Cell00";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIButton *guanZhuBtn = [cell viewWithTag:201];
        [guanZhuBtn addTarget:self action:@selector(guanZhuBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if (indexPath.row == 1){//
        IdentCell = @"Cell01";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2){//
        IdentCell = @"Cell02";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIView *contentV = cell.contentView;
        NSArray *subViewArr = contentV.subviews;
        if (subViewArr == nil || subViewArr.count == 0) {//还没有创建
            [contentV addSubview:_pageMenu.view];
        }
        return cell;
    }
    return cell;
}
//tableViewCell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//
        [self showMsg:@"猫宁call"];
    }else if (indexPath.row == 1){//
        [self showMsg:@"我的关注"];
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//关注Btn点击事件
-(void)guanZhuBtnClick{
    [self showMsg:@"添加关注"];
}
//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self showMsg:@"返回"];
    //    [self.navigationController popViewControllerAnimated:YES];
}

@end
