//
//  LearnViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/5/14.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "LearnViewController.h"
#import "LoginViewController.h"

@interface LearnViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchB;
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property (strong, nonatomic) NSMutableArray *tuiJianNeiRongL;

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableV.tableFooterView = [[UIView alloc] init];
    _tuiJianNeiRongL = [[NSMutableArray alloc] initWithObjects:@"tjTingzzh", @"tjTingzzh", @"tjTingzzh", @"tjTingzzh", nil];
    _searchB.layer.borderWidth = 0;
    _searchB.tintColor = [UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [self showTabBar];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    if (![Tools isLogin]) {//没有登录
        
        if ([[NSUserDefaults standardUserDefaults] valueForKey:@"hadShowLoginVC"] == nil || [[[NSUserDefaults standardUserDefaults]valueForKey:@"hadShowLoginVC"] isEqualToString:@"NO"]) {//没有显示过登录页面
            [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"hadShowLoginVC"];
            [self p_presentLoginVC];
        }
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"hadShowLoginVC"];
    }
}
/**
 跳转登陆页面
 */
- (IBAction)p_presentLoginVC{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LoginViewController *loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"LoginVC"];
    loginVC.whereFrom = @"1";
    [self.navigationController pushViewController:loginVC animated:YES];
//    [self presentViewController:loginVC animated:NO completion:nil];
}
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
    if (indexPath.row == 0) {//
        return 425 * PxHeight7P;
    }else if (indexPath.row == 1){//
        return 44 * PxHeight7P;
    }else if (indexPath.row == 2){//
        return 199 * PxHeight7P;
    }else if (indexPath.row == 3 || indexPath.row == 7){//
        return 8 * PxHeight7P;
    }else if (indexPath.row == 4){//
        return 45 * PxHeight7P;
    }else if (indexPath.row == 5){//
        return 111 * PxHeight7P;
    }else if (indexPath.row == 6){//
        return 18 * PxHeight7P;
    }else if (indexPath.row == 8){//
        return 47 * PxHeight7P;
    }else if (indexPath.row == 9){//
        return 228 * PxHeight7P;
    }else if (indexPath.row == 10){//
        return 13 * PxHeight7P;
    }else if (indexPath.row == 11){//白色高16
        return 16 * PxHeight7P;
    }else if (indexPath.row == 12){//
        return 228 * PxHeight7P;
    }else if (indexPath.row == 13){//
        return 13 * PxHeight7P;
    }else if (indexPath.row == 14){//
        return 8 * PxHeight7P;
    }else if (indexPath.row == 15){//
        return 57 * PxHeight7P;
    }else if (indexPath.row == 16){//
        return 156 * PxHeight7P;
    }
    return 47 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    if (indexPath.row == 0) {//
        IdentCell = @"Cell00";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIView *rootV = [cell.contentView viewWithTag:101];
        //颜色从2F8AFF（47，138，255）渐变到19e0ff（25,224,255），用代码设置颜色(采用sRGB标准）是从57，159，255渐变到0，229，255
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//        gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:47/255.0 green:138/255.0 blue:255/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:25/255.0 green:224/255.0 blue:255/255.0 alpha:1.0].CGColor];
        gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:57/255.0 green:159/255.0 blue:255/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:24/255.0 green:223/255.0 blue:254/255.0 alpha:1.0].CGColor];
        gradientLayer.locations = @[@0.0, @1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(0, 1.0);
        gradientLayer.frame = CGRectMake(0, 0, rootV.bounds.size.width, rootV.bounds.size.height);
//        gradientLayer.frame = rootV.frame;
//        [rootV.layer addSublayer:gradientLayer];
        [rootV.layer insertSublayer:gradientLayer atIndex:0];
        return cell;
    }else if (indexPath.row == 1){//
        IdentCell = @"Cell01";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2){//
        IdentCell = @"Cell02";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 3 || indexPath.row == 7){//
        IdentCell = @"CellH8";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 4){//
        IdentCell = @"Cell03";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 5){//推荐内容
        IdentCell = @"Cell04";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        UIScrollView *scroV = [cell viewWithTag:101];
        //先清空之前_backScrollView
        for (UIImageView *imageV in scroV.subviews) {
            [imageV removeFromSuperview];
        }
        if (_tuiJianNeiRongL != nil && _tuiJianNeiRongL.count != 0) {//如果数组不为空
            //设置ScrollView的contentSize值
//            scroV.contentSize = CGSizeMake(kScreenWidth * _tuiJianNeiRongL.count, cell.bounds.size.height);
//            for (int i = 0; i < _tuiJianNeiRongL.count; i++) {
//                UIImageView *imageViewTemp = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, cell.bounds.size.height)];
//                [imageViewTemp sd_setImageWithURL:[NSURL URLWithString:[_tuiJianNeiRongL objectAtIndex:i]] placeholderImage:[UIImage imageNamed:@"loadingImage"]];
//                [scroV addSubview:imageViewTemp];
//            }
        }
        return cell;
    }else if (indexPath.row == 6){//
        IdentCell = @"CellHW18";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 8){//
        IdentCell = @"Cell05";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 9){//
        IdentCell = @"Cell06";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 10){//
        IdentCell = @"Cell07";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 11){//
        IdentCell = @"CellHW18";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 12){//
        IdentCell = @"Cell06";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 13){//
        IdentCell = @"CellHW18";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 14){//
        IdentCell = @"CellH8";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 15){//
        IdentCell = @"Cell08";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 16){//
        IdentCell = @"Cell09";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }
    return cell;
}
//tableViewCell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self showMsg:@"签到"];
}
//主页Btn
- (IBAction)rightBtnClick:(UIButton *)sender {
    [self showMsg:@"通知"];
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
