//
//  LiuYanJiaViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/7/2.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "LiuYanJiaViewController.h"

@interface LiuYanJiaViewController ()
@property (assign, nonatomic) BOOL isLeft;//是搜到的留言还是我的留言
@property (weak, nonatomic) IBOutlet UIButton *shouDaoLiuYanBtn;//收到的留言Btn


@end

@implementation LiuYanJiaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isLeft = YES;
    [self changeTypeBtnClick:_shouDaoLiuYanBtn];
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
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillDisappear:animated];
}

#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    
    UITableViewCell *cell;
    IdentCell = @"Cell00";
    cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
    
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
//切换类型
- (IBAction)changeTypeBtnClick:(UIButton *)sender {
    if (sender.tag == 101) {
        _isLeft = YES;
    }else{
        _isLeft = NO;
    }
    UIView *superV = sender.superview;//未选中的btn字体颜色是#333333即51，51，51   自己修改#EEEEEE即238，238，238
    UIButton *leftBtn = [superV viewWithTag:101];//左侧Btn
    [leftBtn setTitleColor:_isLeft? Color_BaseColor : [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];
    UIView *leftLineV = [superV viewWithTag:102];//左侧线条
    [leftLineV setHidden:_isLeft? NO : YES];
    UIButton *rightBtn = [superV viewWithTag:201];//右侧Btn
    [rightBtn setTitleColor:!_isLeft ? Color_BaseColor : [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0] forState:UIControlStateNormal];
    UIButton *rightLineV = [superV viewWithTag:202];//右侧线条
    [rightLineV setHidden:!_isLeft? NO : YES];
}


//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
