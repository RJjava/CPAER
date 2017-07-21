//
//  YaoQingHaoYouViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/7/5.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "YaoQingHaoYouViewController.h"

@interface YaoQingHaoYouViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countYaoQingLab;//邀请好友数量Lab
@property (weak, nonatomic) IBOutlet UILabel *countJiFenLab;//获得的积分数量


@end

@implementation YaoQingHaoYouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//微信分享
- (IBAction)weiXinShare:(UIButton *)sender {
    [self showMsg:@"分享到微信"];
}
//微博分享
- (IBAction)weiBoShare:(UIButton *)sender {
    [self showMsg:@"分享到微博"];
}
//QQ分享
- (IBAction)qqShare:(UIButton *)sender {
    [self showMsg:@"分享到QQ"];
}


//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
