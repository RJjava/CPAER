//
//  FaXianViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/8/25.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "FaXianViewController.h"
#import "TopicService.h"
#import "GetGroutListService.h"
#import "SupportTopic.h"

@interface FaXianViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property (strong, nonatomic) NSMutableArray *tuiJianXiaoZuArr;//推荐小组数组
@property (strong, nonatomic) NSMutableArray *xinXiaoZuArr;//新成立小组数组
@property (strong, nonatomic) NSMutableArray *hotTopicArr;//热门话题数组
@property (strong, nonatomic) NSString *resourceUrl;


@end

@implementation FaXianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableV.tableFooterView = [[UIView alloc] init];
    _tuiJianXiaoZuArr = [[NSMutableArray alloc] init];
    _xinXiaoZuArr = [[NSMutableArray alloc] init];
    _hotTopicArr = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [self showTabBar];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    [self P_getTuiJianXiaoZuByisRecommend:@"1"];
    [self P_getXinXiaoZuByisRecommend:@"0"];
    [self P_getHotTopicList];
}
#pragma mark - 获取推荐小组
- (void)P_getTuiJianXiaoZuByisRecommend:(NSString *)isRecommend{
    [[GetGroutListService sharedService] getGroupListBySubjectId:@"" groupId:@"" isRecommend:isRecommend Handler:^(id object, NSError *err) {
        if(!err){//请求成功
//            NSLog(@"%@",object);
            _resourceUrl = [object objectForKey:@"resourceUrl"];
            _tuiJianXiaoZuArr = [object objectForKey:@"groupList"];
            [_tableV reloadData];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
#pragma mark - 获取新成立小组
- (void)P_getXinXiaoZuByisRecommend:(NSString *)isRecommend{
    [[GetGroutListService sharedService] getGroupListBySubjectId:@"" groupId:@"" isRecommend:isRecommend Handler:^(id object, NSError *err) {
        if(!err){//请求成功
//            NSLog(@"%@",object);
            _resourceUrl = [object objectForKey:@"resourceUrl"];
            _xinXiaoZuArr = [object objectForKey:@"groupList"];
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
            _hotTopicArr = [object objectForKey:@"data"];
            _resourceUrl = [object objectForKey:@"resourceUrl"];
            [_tableV reloadData];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
#pragma mark - TableView代理
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {//推荐小组
        return 3;
    }else if (section == 1){//新成立小组
        return 4;
    }else if (section == 2){//热门话题
        if (_hotTopicArr != nil && _hotTopicArr.count != 0) {//热门话题有数据
            return _hotTopicArr.count * 2 + 2;
        }else{//热门话题没有数据
            return 2;
        }
    }
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {//推荐小组
        if (indexPath.row == 0) {
            return 45 * PxHeight7P;
        }else if (indexPath.row == 1){
            return 140 * PxHeight7P;
        }else if (indexPath.row == 2){
            return 8 * PxHeight7P;
        }
    }else if (indexPath.section == 1){//新成立小组
        if (indexPath.row == 0) {
            return 45 * PxHeight7P;
        }else if (indexPath.row == 1){
            return 64 * PxHeight7P;
        }else if (indexPath.row == 2){
            return 8 * PxHeight7P;
        }else if (indexPath.row == 3){
            return 8 * PxHeight7P;
        }
    }else if (indexPath.section == 2){//热门话题
        if (indexPath.row == 0) {
            return 47 *PxHeight7P;
        }else if (indexPath.row == 1){
            return 0;
        }else if (indexPath.row % 2 == 0){
            return 228 * PxHeight7P;
        }else if (indexPath.row == ((_hotTopicArr != nil)? _hotTopicArr.count*2 : 0) + 2){
            return 35 * PxWidth7P;
        }else{
            return 24 * PxHeight7P;
        }
    }
    return 44 * PxHeight7P;
}
//执行显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *IdentCell = [[NSString alloc] init];
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {//推荐小组
        if (indexPath.row == 0) {
            IdentCell = @"Cell00";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 1){
            if (_tuiJianXiaoZuArr == nil || _tuiJianXiaoZuArr.count == 0) {
                IdentCell = @"CellNoZu";
                cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
                return cell;
            }else{
                IdentCell = @"Cell01";
                cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
                UIScrollView *scrollV = [cell viewWithTag:101];
                //先清空之前_backScrollView
                for (UIImageView *imageV in scrollV.subviews) {
                    [imageV removeFromSuperview];
                }
                UIView *zuView = [cell viewWithTag:1001];
                CGFloat contentSizeL = 106 * PxHeight7P * _tuiJianXiaoZuArr.count + 17 * 2 + (_tuiJianXiaoZuArr.count - 1) * 7;
                if (contentSizeL <= cell.bounds.size.width) {
                    scrollV.contentSize = CGSizeMake(cell.bounds.size.width, cell.bounds.size.height);
                }else{
                    scrollV.contentSize = CGSizeMake(contentSizeL, cell.bounds.size.height);
                }
                for (int i = 0; i < _tuiJianXiaoZuArr.count; i++) {
                    NSDictionary *groupDic = [_tuiJianXiaoZuArr objectAtIndex:i];
                    
                    UIView *zuViewTemp = [self duplicate:zuView];
                    zuViewTemp.frame = CGRectMake((106 + 7) * PxHeight7P * i + 17, 0, 106 * PxHeight7P, cell.bounds.size.height);
                    UIButton *btn = [zuViewTemp viewWithTag:201];//小组头像Btn
                    [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_resourceUrl,[groupDic objectForKey:@"groupLogoUrl"]]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"zuZzh"]];
                    btn.tag = 201 + i;
                    [btn setFrame:CGRectMake(0, 0, 106 * PxHeight7P, 106 * PxHeight7P)];
                    [btn addTarget:self action:@selector(P_goToGroupDetailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                    UILabel *nameLab = [zuViewTemp viewWithTag:202];//小组名称
                    nameLab.text = [groupDic objectForKey:@"groupName"];
                    [nameLab setFrame:CGRectMake(0, 106 * PxHeight7P, 106 * PxHeight7P, 34 * PxHeight7P)];
                    [scrollV addSubview:zuViewTemp];
                }
                return cell;
            }
        }else if (indexPath.row == 2){
            IdentCell = @"CellHeight8";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }
    }else if (indexPath.section == 1){//新成立小组
        if (indexPath.row == 0) {
            IdentCell = @"Cell02";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 1){
            if (_xinXiaoZuArr == nil || _xinXiaoZuArr.count == 0) {
                IdentCell = @"CellNoZu";
                cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
                return cell;
            }else{
                IdentCell = @"Cell03";
                cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
                UIScrollView *scrollV = [cell viewWithTag:101];
                //先清空之前_backScrollView
                for (UIImageView *imageV in scrollV.subviews) {
                    [imageV removeFromSuperview];
                }
                UIView *zuView = [cell viewWithTag:1001];
                CGFloat contentSizeL = 162 * PxHeight7P * _xinXiaoZuArr.count + 17 * 2 + (_xinXiaoZuArr.count - 1) * 7;
                if (contentSizeL <= cell.bounds.size.width) {
                    scrollV.contentSize = CGSizeMake(cell.bounds.size.width, cell.bounds.size.height);
                }else{
                    scrollV.contentSize = CGSizeMake(contentSizeL, cell.bounds.size.height);
                }
                for (int i = 0; i < _xinXiaoZuArr.count; i++) {
                    NSDictionary *groupDic = [_xinXiaoZuArr objectAtIndex:i];
                    
                    UIView *zuViewTemp = [self duplicate:zuView];
                    zuViewTemp.frame = CGRectMake((162 + 7) * PxHeight7P * i + 17, 0, 162 * PxHeight7P, cell.bounds.size.height);
                    //将图层的边框设置为圆脚
                    zuViewTemp.layer.cornerRadius = 3;
                    zuViewTemp.layer.masksToBounds = YES;
                    //给图层添加一个有色边框
                    zuViewTemp.layer.borderWidth = 1;
                    zuViewTemp.layer.borderColor = [[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1] CGColor];
                    UIButton *btn = [zuViewTemp viewWithTag:201];//小组头像Btn
                    [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_resourceUrl,[groupDic objectForKey:@"groupLogoUrl"]]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"zuZzh"]];
                    btn.tag = 2001 + i;
                    [btn setFrame:CGRectMake(0, 0, 64 * PxHeight7P, 64 * PxHeight7P)];
                    [btn addTarget:self action:@selector(P_goToGroupDetailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                    UILabel *nameLab1 = [zuViewTemp viewWithTag:202];//科目分类
                    nameLab1.text = [groupDic objectForKey:@"subjectName"];
                    [nameLab1 setFrame:CGRectMake(64 * PxHeight7P, 0, 98 * PxHeight7P, 32 * PxHeight7P)];
                    UILabel *nameLab2 = [zuViewTemp viewWithTag:203];//小组名称
                    nameLab2.text = [groupDic objectForKey:@"groupName"];
                    [nameLab2 setFrame:CGRectMake(64 * PxHeight7P, 32 * PxHeight7P, 98 * PxHeight7P, 32 * PxHeight7P)];
                    [scrollV addSubview:zuViewTemp];
                }
                return cell;
            }
        }else if (indexPath.row == 2){
            IdentCell = @"CellWHeight8";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 3){
            IdentCell = @"CellHeight8";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }
    }else if (indexPath.section == 2){//热门话题
        if (indexPath.row == 0) {
            IdentCell = @"Cell04";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row % 2 == 0){
            IdentCell = @"Cell05";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            NSDictionary *hotTopicDic = [_hotTopicArr objectAtIndex:indexPath.row/2 - 1];
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
            return cell;
        }else if (indexPath.row == ((_hotTopicArr != nil)? _hotTopicArr.count*2 : 0) + 1){
            IdentCell = @"Cell07";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }else{
            IdentCell = @"Cell06";
            cell = [tableView dequeueReusableCellWithIdentifier:IdentCell forIndexPath:indexPath];
            return cell;
        }
    }
    
    return cell;
}
//tableViewCell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//小组Btn点击事件（进入小组详情页）
- (void)P_goToGroupDetailBtnClick:(UIButton *)btn{
    //tag为201+ 是推荐小组
    //tag为2001+ 是新成立小组
    NSDictionary *groupDic;
    if (btn.tag < 2000) {
        groupDic = [_tuiJianXiaoZuArr objectAtIndex:btn.tag - 201];
    }else{
        groupDic = [_xinXiaoZuArr objectAtIndex:btn.tag - 2001];
    }
    NSLog(@"%@",groupDic);
}
//完全复制一个View
- (UIView*)duplicate:(UIView*)view
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}
/**
 给话题点赞
 */
- (void)loveTopicBtnClick:(UIButton *)btn{
    if ([Tools isLogin]) {//已经登录
        UITableViewCell *cellTemp = (UITableViewCell *)btn.superview.superview;
        NSIndexPath *indexP = [_tableV indexPathForCell:cellTemp];
        NSDictionary *topicDic = [_hotTopicArr objectAtIndex:indexP.row/2 - 1];
        [[SupportTopic sharedService] supportTopicWithIsSupport:YES topicId:[topicDic objectForKey:@"topicId"] Handler:^(id object, NSError *err) {
            if(!err){//请求成功
                //            NSLog(@"%@",object);
                //                [self showMsg:@"点赞成功"];
                [self P_getHotTopicList];
            }else{//请求失败
                [self showMsg:err.localizedDescription];
            }
        }];
    }else{
        [self showMsg:@"登陆才可以点赞哦"];
    }
}
//添加小组Btn点击事件
- (IBAction)addGroupBtnClick:(id)sender {
    [self showMsg:@"添加小组"];
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
