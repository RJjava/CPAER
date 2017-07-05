//
//  GeRenCenterViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/6/16.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "GeRenCenterViewController.h"
#import "GuanZhuViewController.h"
#import "LiuYanJiaViewController.h"

@interface GeRenCenterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableV;

@end

@implementation GeRenCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableV.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated{
//    //取消导航栏底部线条
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    //设置导航栏颜色
//    self.navigationController.navigationBar.barTintColor = Color_BaseColor;
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"sttt"] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
//#pragma mark - 设置状态栏
////状态栏的样式
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    //设置为白色
//    return UIStatusBarStyleLightContent;
//}
////设置状态栏是否隐藏（否）
//-(BOOL)prefersStatusBarHidden{
//    return NO;
//}

#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 17;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//头像
        return  160 * PxHeight7P;
    }else if (indexPath.row == 1){//关注粉丝积分
        return 40 * PxHeight7P;
    }else if (indexPath.row == 9 || indexPath.row == 14){//间隔8cell
        return 8 * PxHeight7P;
    }else if (indexPath.row == 16){//最后一行
        return 85 * PxHeight7P;
    }
    return 47 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.row == 0) {//头像
        IdentCell = @"Cell00";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1){//关注粉丝积分
        IdentCell = @"Cell01";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2){//签到栏
        IdentCell = @"Cell02";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIButton *qianDaoBtn = [cell viewWithTag:101];//签到Btn
        [qianDaoBtn addTarget:self action:@selector(qianDaoBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if (indexPath.row == 9 || indexPath.row == 14){//
        IdentCell = @"CellH8";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 16){//
        IdentCell = @"CellH85";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 8 || indexPath.row == 13 || indexPath.row == 15) {//
        IdentCell = @"Cell04";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIImageView *img = [cell viewWithTag:101];
        UILabel *lab = [cell viewWithTag:102];
        if (indexPath.row == 8) {
            [img setImage:[UIImage imageNamed:@"icon_06"]];//我的提问
            [lab setText:@"我的提问"];
        }else if (indexPath.row == 13){
            [img setImage:[UIImage imageNamed:@"icon_10"]];//我的留言夹
            [lab setText:@"我的留言夹"];
        }else if (indexPath.row == 15){
            [img setImage:[UIImage imageNamed:@"icon_11"]];//设置
            [lab setText:@"设置"];
        }
        return cell;
    }else {//
        IdentCell = @"Cell03";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIImageView *img = [cell viewWithTag:101];
        UILabel *lab = [cell viewWithTag:102];
        if (indexPath.row == 3) {
            [img setImage:[UIImage imageNamed:@"icon_01"]];//猫宁call
            [lab setText:@"猫宁call"];
        }else if (indexPath.row == 4){
            [img setImage:[UIImage imageNamed:@"icon_02"]];//我的关注
            [lab setText:@"我的关注"];
        }else if (indexPath.row == 5){
            [img setImage:[UIImage imageNamed:@"icon_03"]];//邀请
            [lab setText:@"邀请"];
        }else if (indexPath.row == 6){
            [img setImage:[UIImage imageNamed:@"icon_04"]];//我的下载
            [lab setText:@"我的下载"];
        }else if (indexPath.row == 7){
            [img setImage:[UIImage imageNamed:@"icon_05"]];//我的收藏
            [lab setText:@"我的收藏"];
        }else if (indexPath.row == 10){
            [img setImage:[UIImage imageNamed:@"icon_07"]];//我的小组
            [lab setText:@"我的小组"];
        }else if (indexPath.row == 11){
            [img setImage:[UIImage imageNamed:@"icon_08"]];//错题库
            [lab setText:@"错题库"];
        }else if (indexPath.row == 12){
            [img setImage:[UIImage imageNamed:@"icon_09"]];//排行榜
            [lab setText:@"排行榜"];
        }
        return cell;
    }
    return cell;
}
//tableViewCell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (indexPath.row == 3) {//猫宁call
        [self showMsg:@"猫宁call"];
    }else if (indexPath.row == 4){//我的关注
        GuanZhuViewController *guanZhuVC = [storyBoard instantiateViewControllerWithIdentifier:@"GuanZhuVC"];
        [self.navigationController pushViewController:guanZhuVC animated:YES];
    }else if (indexPath.row == 5){//邀请
        [self showMsg:@"邀请"];
    }else if (indexPath.row == 6){//我的下载
        [self showMsg:@"我的下载"];
    }else if (indexPath.row == 7){//我的收藏
        [self showMsg:@"我的收藏"];
    }else if (indexPath.row == 8){//我的提问
        [self showMsg:@"我的提问"];
    }else if (indexPath.row == 10){//我的小组
        [self showMsg:@"我的小组"];
    }else if (indexPath.row == 11){//错题库
        [self showMsg:@"错题库"];
    }else if (indexPath.row == 12){//排行榜
        [self showMsg:@"排行榜"];
    }else if (indexPath.row == 13){//我的留言夹
        LiuYanJiaViewController *liuYanJiaVC = [storyBoard instantiateViewControllerWithIdentifier:@"LiuYanJiaVC"];
        [self.navigationController pushViewController:liuYanJiaVC animated:YES];
    }else if (indexPath.row == 15){//设置
        [self showMsg:@"设置"];
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
//签到Btn点击事件
- (void)qianDaoBtnClick{
    [self showMsg:@"签到"];
}
//主页Btn
- (IBAction)rightBtnClick:(UIButton *)sender {
    //    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
