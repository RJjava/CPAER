//
//  BaoKaoKeMuViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/6/29.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaoKaoKeMuViewController.h"

@interface BaoKaoKeMuViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property (strong, nonatomic) NSMutableArray *selectKeMuArr;

@end

@implementation BaoKaoKeMuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectKeMuArr = [[NSMutableArray alloc] initWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", nil];
    _tableV.tableFooterView = [[UIView alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row <= 5) {//
        return 49 * PxHeight7P;
    }else if (indexPath.row == 6){//间隔20cell
        return 20 * PxHeight7P;
    }else if (indexPath.row == 7){//间隔20cell
        return 50 * PxHeight7P;//提交
    }
    return 0 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.row <= 4) {//
        NSArray *titleArr = [NSArray arrayWithObjects:@"会计", @"审计", @"财务成本管理", @"公司战略与风险管理", @"经济法", @"税法", nil];
        IdentCell = @"Cell00";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UILabel *titleLab = [cell viewWithTag:101];
        titleLab.text = [titleArr objectAtIndex:indexPath.row];
        UIImageView *selectV = [cell viewWithTag:102];//是否选中图片
        NSString *selectFlagStr = [_selectKeMuArr objectAtIndex:indexPath.row];
        [selectV setHidden:[selectFlagStr isEqualToString:@"1"]? NO:YES];
        return cell;
    }else if (indexPath.row == 5){//
        IdentCell = @"Cell01";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UILabel *titleLab = [cell viewWithTag:101];
        titleLab.text = @"税法";
        UIImageView *selectV = [cell viewWithTag:102];//是否选中图片
        NSString *selectFlagStr = [_selectKeMuArr objectAtIndex:indexPath.row];
        [selectV setHidden:[selectFlagStr isEqualToString:@"1"]? NO:YES];
        return cell;
    }else if (indexPath.row == 6){//
        IdentCell = @"CellH20";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 7){//
        IdentCell = @"CellSub";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIButton *subBtn = [cell viewWithTag:101];
        [subBtn addTarget:self action:@selector(subBtnClick) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    return cell;
}
//tableViewCell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row <= 5) {//
        NSString *currFlagStr = [_selectKeMuArr objectAtIndex:indexPath.row];
        [_selectKeMuArr setObject:[currFlagStr isEqualToString:@"1"] ? @"0" : @"1" atIndexedSubscript:indexPath.row];
        NSIndexPath *currIndex = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        [_tableV reloadRowsAtIndexPaths:[NSArray arrayWithObjects:currIndex, nil] withRowAnimation:UITableViewRowAnimationNone];
    }
}

-(void)subBtnClick{
    [self showMsg:@"提交"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
