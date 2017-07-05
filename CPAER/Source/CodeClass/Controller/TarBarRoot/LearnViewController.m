//
//  LearnViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/5/14.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "LearnViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "FindPassWordViewController.h"
#import "FindPassWordViewController.h"
#import "WanShanZiLiaoViewController.h"
#import "ZhuCeXieYiViewController.h"
#import "BaoKaoDateViewController.h"
#import "BaoKaoKeMuViewController.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
//    [self presentLoginVC];
}
/**
 跳转登陆页面
 */
- (IBAction)tiaoZhuanBtnClick:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    BaoKaoKeMuViewController *loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"BaoKaoKeMuVC"];
    [self.navigationController pushViewController:loginVC animated:YES];
//    [self presentViewController:loginVC animated:NO completion:nil];
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
