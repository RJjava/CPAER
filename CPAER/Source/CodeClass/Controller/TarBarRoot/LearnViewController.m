//
//  LearnViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/5/14.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "LearnViewController.h"
#import "LoginViewController.h"
#import "HomeDataService.h"
#import "TopicService.h"
#import "SupportTopic.h"

@interface LearnViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchB;
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property (strong, nonatomic) NSMutableArray *tuiJianNeiRongL;
@property (strong, nonatomic) NSMutableDictionary *cell00Dci;//第一行显示的数据
@property (strong, nonatomic) NSMutableArray *hotTopicList;//热门话题列表
@property (strong, nonatomic) NSString *resourceUrl;
@property (strong, nonatomic) NSMutableArray *myTopicList;//我的话题


@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableV.tableFooterView = [[UIView alloc] init];
    _tuiJianNeiRongL = [[NSMutableArray alloc] initWithObjects:@"tjTingzzh", @"tjTingzzh", @"tjTingzzh", @"tjTingzzh", nil];
    _searchB.layer.borderWidth = 0;
    _searchB.tintColor = [UIColor clearColor];
    _cell00Dci = [[NSMutableDictionary alloc] init];
    _hotTopicList = [[NSMutableArray alloc] init];
    _resourceUrl = @"";
    _myTopicList = [[NSMutableArray alloc] init];
    
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
        [_myTopicList removeAllObjects];
        [_tableV reloadData];
        if ([[NSUserDefaults standardUserDefaults] valueForKey:@"hadShowLoginVC"] == nil || [[[NSUserDefaults standardUserDefaults]valueForKey:@"hadShowLoginVC"] isEqualToString:@"NO"]) {//没有显示过登录页面
            [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"hadShowLoginVC"];
            [self p_presentLoginVC];
        }
        [self P_getHomeData];
        [self P_getHotTopicList];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"hadShowLoginVC"];
        [self P_getHomeData];
        [self P_getHotTopicList];
        [self P_getMyTopicList];
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
#pragma mark - 获取首页数据
- (void)P_getHomeData{
    [[HomeDataService sharedService] getFirstPageDataWith:^(id object, NSError *err) {
        if(!err){//请求成功
//            NSLog(@"%@",object);
            NSDictionary *dataDic = [object objectForKey:@"data"];
            
            //剩余天数设置
            NSString *leftDaysStr = [dataDic objectForKey:@"cpaTestDifferDay"];
            long leftDays = [leftDaysStr longLongValue];
            [_cell00Dci setObject:[NSString stringWithFormat:@"%ld",leftDays / 100] forKey:@"yearLeft"];
            [_cell00Dci setObject:[NSString stringWithFormat:@"%ld",(leftDays / 10) % 10] forKey:@"mountLeft"];
            [_cell00Dci setObject:[NSString stringWithFormat:@"%ld",leftDays % 10] forKey:@"dayLeft"];
            //名言警句设置
            NSArray *encourageListArr = [dataDic objectForKey:@"encourageList"];
            NSDictionary *encourageListDic = [encourageListArr objectAtIndex:0];
            NSString *mingYanStr = [encourageListDic objectForKey:@"encContent"];
            [_cell00Dci setObject:mingYanStr forKey:@"encContent"];
            //年月日设置
            [_cell00Dci setObject:[dataDic objectForKey:@"curDate"] forKey:@"curDate"];
            //参加每日一练的人数设置
            NSString *curDateStr = [dataDic objectForKey:@"everyDayExerciseCount"];
            long curDateLong = [curDateStr longLongValue];
            [_cell00Dci setObject:[NSString stringWithFormat:@"%ld",curDateLong] forKey:@"everyDayExerciseCount"];
            
            
            [_tableV reloadData];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
#pragma mark - 获取首页热门话题
- (void)P_getHotTopicList{
    [[TopicService sharedService] getTopicListWithIsHot:YES GroupId:@"1" Handler:^(id object, NSError *err) {
        if(!err){//请求成功
//            NSLog(@"%@",object);
            _hotTopicList = [object objectForKey:@"data"];
            _resourceUrl = [object objectForKey:@"resourceUrl"];
            [_tableV reloadData];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
#pragma mark - 获取我的话题
- (void)P_getMyTopicList{
    [[TopicService sharedService] getTopicListWithIsHot:NO GroupId:@"1" Handler:^(id object, NSError *err) {
        if(!err){//请求成功
//            NSLog(@"%@",object);
            _resourceUrl = [object objectForKey:@"resourceUrl"];
            _myTopicList = [object objectForKey:@"data"];
            [_tableV reloadData];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
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
    }else if (indexPath.row == 9){//热门话题第一个
        if (_hotTopicList == nil || _hotTopicList.count == 0) {
            return 0;
        }
        return 228 * PxHeight7P;
    }else if (indexPath.row == 10){//
        if (_hotTopicList == nil || _hotTopicList.count <= 1) {
            return 0;
        }
        return 13 * PxHeight7P;
    }else if (indexPath.row == 11){//白色高16
        if (_hotTopicList == nil || _hotTopicList.count <= 1) {
            return 0;
        }
        return 16 * PxHeight7P;
    }else if (indexPath.row == 12){//
        if (_hotTopicList == nil || _hotTopicList.count <= 1) {
            return 0;
        }
        return 228 * PxHeight7P;
    }else if (indexPath.row == 13){//
        return 13 * PxHeight7P;
    }else if (indexPath.row == 14){//
        if (_myTopicList == nil || _myTopicList.count == 0) {
            return 0;
        }
        return 8 * PxHeight7P;
    }else if (indexPath.row == 15){//
        if (_myTopicList == nil || _myTopicList.count == 0) {
            return 0;
        }
        return 57 * PxHeight7P;
    }else if (indexPath.row == 16){//
        if (_myTopicList == nil || _myTopicList.count == 0) {
            return 0;
        }
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
        UIView *rootV = [cell.contentView viewWithTag:201];
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
        if (_cell00Dci != nil && _cell00Dci.count != 0) {
            UILabel *yearLeftLab = [cell viewWithTag:101];//剩余：年
            yearLeftLab.text = [_cell00Dci objectForKey:@"yearLeft"];
            UILabel *mountLeftLab = [cell viewWithTag:102];//剩余：月
            mountLeftLab.text = [_cell00Dci objectForKey:@"mountLeft"];
            UILabel *dayLeftLab = [cell viewWithTag:103];//剩余：日
            dayLeftLab.text = [_cell00Dci objectForKey:@"dayLeft"];
            UILabel *mingYanLab = [cell viewWithTag:104];//名言警句
            mingYanLab.text = [_cell00Dci objectForKey:@"encContent"];
            UILabel *riQiLab = [cell viewWithTag:105];//日期
            riQiLab.text = [_cell00Dci objectForKey:@"curDate"];
            UILabel *everyDayExerciseCountLab = [cell viewWithTag:106];//已经参加每日一练的人数
            everyDayExerciseCountLab.text = [NSString stringWithFormat:@"%@人已参加",[_cell00Dci objectForKey:@"everyDayExerciseCount"]];
        }
        UIButton *meiRiYiLianBtn = [cell viewWithTag:107];//每日一练Btn
        [meiRiYiLianBtn addTarget:self action:@selector(P_meiRiYiLianBtnClick) forControlEvents:UIControlEventTouchUpInside];
        UIButton *liWuBtn = [cell viewWithTag:108];//礼物图标Btn
        [liWuBtn addTarget:self action:@selector(P_liWuBtnClick) forControlEvents:UIControlEventTouchUpInside];
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
        for (int i = 101; i <= 104; i ++) {
            UIButton *btnTemp = [cell viewWithTag:i];
            [btnTemp addTarget:self action:@selector(P_tkdxBtnClick:) forControlEvents:UIControlEventTouchUpInside];
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
    }else if (indexPath.row == 9 || indexPath.row == 12){//热门话题
        IdentCell = @"Cell06";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        if (_hotTopicList != nil && _hotTopicList.count != 0) {
            if (indexPath.row == 12 && _hotTopicList.count == 1) {
                return cell;
            }else{
                NSDictionary *hotTopicDic = [_hotTopicList objectAtIndex:indexPath.row == 9 ? 0:1];
//                UIImageView *headImgV = [cell viewWithTag:101];//头像
//                
                UILabel *nickNameLab = [cell viewWithTag:102];//昵称
                nickNameLab.text = [hotTopicDic objectForKey:@"nickName"];
                UILabel *fromLab = [cell viewWithTag:103];//话题来源
                fromLab.text = [NSString stringWithFormat:@"来自%@的文章",[hotTopicDic objectForKey:@"groupName"]];
                UILabel *titleLab = [cell viewWithTag:104];//标题
                titleLab.text = [hotTopicDic objectForKey:@"topicTitle"];
                UILabel *contentLab = [cell viewWithTag:105];//内容
                contentLab.text = [hotTopicDic objectForKey:@"topicContent"];
                UILabel *readCountLab = [cell viewWithTag:106];//浏览量、点击数量
                readCountLab.text = [NSString stringWithFormat:@"%ld",[[hotTopicDic objectForKey:@"clickCount"] longValue]];
                UILabel *replyCountLab = [cell viewWithTag:107];//回复量、评论数量
                replyCountLab.text = [NSString stringWithFormat:@"%ld",[[hotTopicDic objectForKey:@"commentCount"] longValue]];
                UIButton *loveBtn = [cell viewWithTag:108];//点赞Btn
                [loveBtn addTarget:self action:@selector(loveTopicBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                UILabel *loveCountLab = [cell viewWithTag:109];//点赞量
                loveCountLab.text = [NSString stringWithFormat:@"%ld",[[hotTopicDic objectForKey:@"supportTCount"] longValue]];
            }
        }
        return cell;
    }else if (indexPath.row == 10){//
        IdentCell = @"Cell07";
        cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 11){//
        IdentCell = @"CellHW18";
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
        if (_myTopicList != nil && _myTopicList.count != 0) {
            NSDictionary *myTopicDic = [_myTopicList objectAtIndex:0];
//            UIImageView *headImageV = [cell viewWithTag:101];//头像
//            
            UILabel *titleLab = [cell viewWithTag:102];//标题
            titleLab.text = [myTopicDic objectForKey:@"topicTitle"];
            UIButton *yaoQingPingLunBtn = [cell viewWithTag:103];//邀请评论
            [yaoQingPingLunBtn addTarget:self action:@selector(P_yaoQingPingLunBtnClick) forControlEvents:UIControlEventTouchUpInside];
            UILabel *contentLab = [cell viewWithTag:104];//话题内容
            contentLab.text = [myTopicDic objectForKey:@"topicContent"];
            UIButton *loveBtn = [cell viewWithTag:105];//点赞Btn
            [loveBtn addTarget:self action:@selector(loveTopicBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            UILabel *loveCountLab = [cell viewWithTag:106];
            loveCountLab.text = [NSString stringWithFormat:@"%ld",[[myTopicDic objectForKey:@"supportTCount"] longValue]];
        }
        return cell;
    }
    return cell;
}
/**
 每日一练Btn点击事件
 */
- (void)P_meiRiYiLianBtnClick{
    [self showMsg:@"每日一练"];
}
/**
 礼物图标点击事件（不知道什么用）
 */
- (void)P_liWuBtnClick{
//    [self showMsg:@"礼物"];
}
/**
 推荐内容点击事件
 */
-(void)P_tkdxBtnClick:(UIButton *)btn{
    if (btn.tag == 101) {
        [self showMsg:@"系统完善中，敬请期待"];
    }else if (btn.tag == 102){
        [self showMsg:@"系统完善中，敬请期待"];
    }else if (btn.tag == 103){
        [self showMsg:@"系统完善中，敬请期待"];
    }else if (btn.tag == 104){
        [self showMsg:@"写"];
    }
}
/**
 给话题点赞
 */
- (void)loveTopicBtnClick:(UIButton *)btn{
    if ([Tools isLogin]) {//已经登录
        UITableViewCell *cellTemp = (UITableViewCell *)btn.superview.superview;
        NSIndexPath *indexP = [_tableV indexPathForCell:cellTemp];
        NSDictionary *topicDic;
        if (indexP.row == 9) {//给第一个热门话题点赞
            topicDic = [_hotTopicList objectAtIndex:1];
        }else if (indexP.row == 12){//给第二个热门话题点赞
            topicDic = [_hotTopicList objectAtIndex:2];
        }else if (indexP.row == 16){//给我的话题点赞
            topicDic = [_myTopicList objectAtIndex:1];
        }
        [[SupportTopic sharedService] supportTopicWithIsSupport:YES topicId:[topicDic objectForKey:@"topicId"] Handler:^(id object, NSError *err) {
            if(!err){//请求成功
                //            NSLog(@"%@",object);
                [self showMsg:@"点赞成功"];
            }else{//请求失败
                [self showMsg:err.localizedDescription];
            }
        }];
    }else{
        [self showMsg:@"登陆才可以点赞哦"];
    }
}
/**
 邀请评论Btn点击事件
 */
- (void)P_yaoQingPingLunBtnClick{
    [self showMsg:@"邀请评论"];
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
