//
//  SheZhiViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/7/10.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "SheZhiViewController.h"

@interface SheZhiViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableV;

@end

@implementation SheZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    _tableV.tableFooterView = [[UIView alloc] init];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [self hideTabBar];
}
#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 16;
}
//头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 7 || indexPath.row == 13 || indexPath.row == 15) {//
        return 8 * PxHeight7P;
    }
    return 48 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.row == 0) {//修改头像
        IdentCell = @"Cell00";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1){//用户名
        IdentCell = @"Cell01";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2){//昵称
        IdentCell = @"Cell02";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 3){//修改密码
        IdentCell = @"Cell03";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 4){//出生年月
        IdentCell = @"Cell04";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 5){//科目切换
        IdentCell = @"Cell05";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 6){//个性签名
        IdentCell = @"Cell06";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 7 || indexPath.row == 13){//间隔8Cell
        IdentCell = @"Cell07";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 8){//清理缓存
        IdentCell = @"Cell08";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 9){//消息提醒
        IdentCell = @"Cell09";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 10){//地区设置
        IdentCell = @"Cell10";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 11){//活动提醒
        IdentCell = @"Cell11";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 12){//小组提醒
        IdentCell = @"Cell12";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 14){//退出登录
        IdentCell = @"Cell13";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 15){//最后一行
        IdentCell = @"Cell14";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }
    return cell;
}
//tableViewCell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//修改头像
        [self showMsg:@"修改头像"];
    }else if (indexPath.row == 1){//用户名
        [self showMsg:@"用户名"];
    }else if (indexPath.row == 2){//昵称
        [self showMsg:@"昵称"];
    }else if (indexPath.row == 3){//修改密码
        [self showMsg:@"修改密码"];
    }else if (indexPath.row == 4){//出生年月
        [self showMsg:@"出生年月"];
    }else if (indexPath.row == 5){//科目切换
        [self showMsg:@"科目切换"];
    }else if (indexPath.row == 6){//个性签名
        [self showMsg:@"个性签名"];
    }else if (indexPath.row == 8){//清理缓存
        [self showMsg:@"清理缓存"];
    }else if (indexPath.row == 9){//消息提醒
        [self showMsg:@"消息提醒"];
    }else if (indexPath.row == 10){//地区设置
        [self showMsg:@"地区设置"];
    }else if (indexPath.row == 11){//活动提醒
        [self showMsg:@"活动提醒"];
    }else if (indexPath.row == 12){//小组提醒
        [self showMsg:@"小组提醒"];
    }else if (indexPath.row == 14){//退出登录
        [Tools logOut];
        [self showMsg:@"已退出登录"];
    }
    
}
//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
