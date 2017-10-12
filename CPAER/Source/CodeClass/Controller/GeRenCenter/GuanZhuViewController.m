//
//  GuanZhuViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/6/30.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "GuanZhuViewController.h"
#import "FollowService.h"
#import "RecommendFollowService.h"

@interface GuanZhuViewController ()
@property (assign, nonatomic) BOOL isLeft;//是左半部分还是又半部分
@property (weak, nonatomic) IBOutlet UIImageView *headBGImgV;
@property (strong, nonatomic) NSMutableArray *guanZhuList;//关注数组
@property (strong, nonatomic) NSMutableArray *guanZhuTuiJianList;//推荐关注列表
@property (weak, nonatomic) IBOutlet UISearchBar *searchB;
@property (weak, nonatomic) IBOutlet UITableView *tableV;

@end

@implementation GuanZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isLeft = YES;
    _guanZhuList = [[NSMutableArray alloc] initWithObjects:@"",@"",@"", nil];
    _guanZhuTuiJianList = [[NSMutableArray alloc] initWithObjects:@"",@"",@"", nil];
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
    [self P_getGuanZhuListBySearchCondit:@""];
    [self P_getGuanZhuTuiJianBySearchCondit:@""];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillDisappear:animated];
}
/*
 获取关注列表
 */
- (void)P_getGuanZhuListBySearchCondit:(NSString *)searchCondit{
    [[FollowService sharedService] getFollowListWithFollowType:@"1" followUserType:_isLeft?@"2":@"1" searchCondit:searchCondit skip:@"1" Handler:^(id object, NSError *err) {
        if(!err){//请求成功
            NSLog(@"%@",object);
            _guanZhuList = [object objectForKey:@"data"];
            [_tableV reloadData];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
/*
 获取关注列表
 */
- (void)P_getGuanZhuTuiJianBySearchCondit:(NSString *)searchCondit{
    [[RecommendFollowService sharedService] getRecommendFollowListBySearchCondit:searchCondit followUserType:_isLeft?@"2":@"1" curPage:@"1" maxLine:@"10" Handler:^(id object, NSError *err) {
        if(!err){//请求成功
            NSLog(@"%@",object);
            _guanZhuTuiJianList = [object objectForKey:@"data"];
            [_tableV reloadData];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if (_guanZhuList != nil && _guanZhuList.count != 0) {
            return _guanZhuList.count + 1;
        }else{
            return 1;
        }
    }else if(section == 1){
        if (_guanZhuTuiJianList != nil && _guanZhuTuiJianList.count != 0) {
            return _guanZhuTuiJianList.count + 1;
        }else{
            return 1;
        }
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && _guanZhuList != nil && _guanZhuList.count != 0 && indexPath.row == 0) {
        return 0;
    }else if (indexPath.section == 1 && indexPath.row ==0) {//
        return 30 * PxHeight7P;
    }
    return 74 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.section == 0) {//第一个分组
        if (indexPath.row == 0) {//
            IdentCell = @"CellHead01";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else{//
            IdentCell = @"Cell00";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            if (_guanZhuList != nil && _guanZhuList.count != 0) {
                NSDictionary *guanZhuDic = [_guanZhuList objectAtIndex:indexPath.row - 1];
                UIImageView *headImgV = [cell viewWithTag:101];//头像
                [headImgV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@""]] placeholderImage:[UIImage imageNamed:@""]];
                UILabel *nickNameLab = [cell viewWithTag:102];//昵称
                
//                UILabel *
            }
            return cell;
        }
    }else if (indexPath.section == 1){//第二个分组
        if (indexPath.row == 0) {//
            IdentCell = @"CellHead";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else{//
            IdentCell = @"Cell02";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }
    }
    
    return cell;
}
//tableViewCell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 *///返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)tuanZhangListBtnClick:(UIButton *)sender {//TS团长列表
    if (!_isLeft) {
        _isLeft = YES;
        [_headBGImgV setImage:[UIImage imageNamed:@"guZhuLeftZZH"]];
        [self P_getGuanZhuListBySearchCondit:@""];
        [self P_getGuanZhuTuiJianBySearchCondit:@""];
    }
}
- (IBAction)tongXueListBtnClick:(UIButton *)sender {//我的同学列表
    if (_isLeft) {
        _isLeft = NO;
        [_headBGImgV setImage:[UIImage imageNamed:@"guZhuRightZZH"]];
        [self P_getGuanZhuListBySearchCondit:@""];
        [self P_getGuanZhuTuiJianBySearchCondit:@""];
    }
}

@end
