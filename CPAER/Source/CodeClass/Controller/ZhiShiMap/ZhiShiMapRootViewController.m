//
//  ZhiShiMapRootViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/7/25.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "ZhiShiMapRootViewController.h"
#import "LDProgressView.h"

@interface ZhiShiMapRootViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *headScrollV;
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property (strong, nonatomic)NSMutableArray *zhangJieArr;

@end

@implementation ZhiShiMapRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _typeFlag = 201;//默认是第一个
    [self P_refreshHeadScrollView];
    _tableV.tableFooterView = [[UIView alloc] init];
    _zhangJieArr = [[NSMutableArray alloc] initWithObjects:@[@"", @"", @""] ,@[@"", @"", @""] ,@[@"", @"", @""] ,@[@"", @"", @""] ,nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_zhangJieArr == nil || _zhangJieArr.count == 0) {
        return 0;
    }
    return _zhangJieArr.count + 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
        return ((NSArray *)[_zhangJieArr objectAtIndex:section -1]).count;
    }
    return 0;
}
//头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 38 * PxHeight7P;
    }
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {//第一个分组
        if (indexPath.row == 0) {//
            return 64 * PxHeight7P;
        }else if (indexPath.row == 1){//
            return 42 * PxHeight7P;
        }else if (indexPath.row == 2){//
            return 30 * PxHeight7P;
        }else if (indexPath.row == 3){//
            return 57 * PxHeight7P;
        }else if (indexPath.row == 4){//
            return 9 * PxHeight7P;
        }
    }else{//其他分组
        return  54 * PxHeight7P;
    }
    return 47 * PxHeight7P;
}

//头视图
- (UIView *)tableView:(nonnull UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (section != 0) {
        IdentCell = @"CellHead01";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell];
        return cell;
    }
    return cell;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.section == 0) {//第一个分组
        if (indexPath.row == 0) {//
            IdentCell = @"Cell00";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 1){//
            IdentCell = @"Cell01";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            LDProgressView *ldProgressV = [cell viewWithTag:101];//进度条
            ldProgressV.color = [UIColor colorWithHexString:@"00ccff"];
            ldProgressV.background = [UIColor colorWithHexString:@"cccccc"];
            ldProgressV.showText = @NO;
            ldProgressV.progress = 0.50;
            ldProgressV.borderRadius = @1;
            ldProgressV.type = LDProgressSolid;
            return cell;
        }else if (indexPath.row == 2){//
            IdentCell = @"Cell02";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 3){//
            IdentCell = @"Cell03";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            UILabel *yiCuoZhangJieLab = [cell viewWithTag:101];//易错章节
            yiCuoZhangJieLab.text = @"金融资产";
            UILabel *cuoTiShuLab = [cell viewWithTag:102];//错题数
            cuoTiShuLab.text = @"88";
            UILabel *zongJiZuoTiLab = [cell viewWithTag:103];//总计做题
            zongJiZuoTiLab.text = @"88";
            UILabel *zongCuoTiShuLab = [cell viewWithTag:104];//总错题数
            zongCuoTiShuLab.text = @"88";
            for (int i = 201; i <= 204; i++) {
                UIButton *tempBtn = [cell viewWithTag:i];
                [tempBtn addTarget:self action:@selector(zuoTiCuotiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            }
            return cell;
        }else if (indexPath.row == 4){//
            IdentCell = @"CellHF4F4F4";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }
    }else{//其他分组
        IdentCell = @"CellContent01";
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
*/
//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//头部Btn点击事件（类型切换）
- (IBAction)typeBtnClick:(UIButton *)sender {
    if (_typeFlag != sender.tag) {
        _typeFlag = sender.tag;
        [self P_refreshHeadScrollView];
    }
}
//刷新头部选中标签
- (void)P_refreshHeadScrollView{
    NSArray *selectHeadImgNameArr = @[@"kemu1", @"kemu2", @"kemu3", @"kemu4", @"kemu5", @"kemu6",];
    NSArray *unSelectHeadImgNameArr =@[@"kemu1_1", @"kemu2_1", @"kemu3_1", @"kemu4_1", @"kemu5_1", @"kemu6_1",];
    for (int i = 201; i <= 206; i++) {
        UIView *tempView = [_headScrollV viewWithTag:i].superview;
        UIImageView *typeImgV = [tempView viewWithTag:101];//图片
        [typeImgV setImage:[UIImage imageNamed:i == _typeFlag ? [selectHeadImgNameArr objectAtIndex:i-201] : [unSelectHeadImgNameArr objectAtIndex:i-201] ]];
        UILabel *titleLab = [tempView viewWithTag:102];//名称
        titleLab.textColor = [UIColor colorWithHexString:i == _typeFlag ? @"00ccff" : @"999999"];
        UIView *bottomLineV = [tempView viewWithTag:103];//底部线条
        bottomLineV.backgroundColor = [UIColor colorWithHexString:i == _typeFlag ? @"00ccff" : @"eeeeee"];
    }
}
//第四行，错题数量等点击事件
- (void)zuoTiCuotiBtnClick:(UIButton *)btn{
    if (btn.tag == 201) {//易错章节
//        [self showMsg:@"易错章节"];
    }else if (btn.tag == 202){//错题数
//        [self showMsg:@"错题数"];
    }else if (btn.tag == 203){//总计做题
//        [self showMsg:@"总计做题"];
    }else if (btn.tag == 204){//总错题数
//        [self showMsg:@"总错题数"];
    }
}
@end
