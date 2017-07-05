//
//  GuanZhuViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/6/30.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "GuanZhuViewController.h"

@interface GuanZhuViewController ()
@property (assign, nonatomic) BOOL isLeft;//是左半部分还是又半部分
@property (weak, nonatomic) IBOutlet UIImageView *headBGImgV;

@end

@implementation GuanZhuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isLeft = YES;
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
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//
        return 30 * PxHeight7P;
    }
    return 74 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.row == 0) {//
        IdentCell = @"CellHead";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row >= 1 && indexPath.row <= 4){//
        IdentCell = @"Cell00";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 5){//
        IdentCell = @"Cell01";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
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
    }
}
- (IBAction)tongXueListBtnClick:(UIButton *)sender {//我的同学列表
    if (_isLeft) {
        _isLeft = NO;
        [_headBGImgV setImage:[UIImage imageNamed:@"guZhuRightZZH"]];
    }
}

@end
