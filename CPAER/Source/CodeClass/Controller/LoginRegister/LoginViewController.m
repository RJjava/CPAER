//
//  LoginViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/5/14.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;//手机号
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;


@end

@implementation LoginViewController

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
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
/**
 登陆按钮点击事件
*/
- (IBAction)loginBtnClick:(UIButton *)sender {
    [[LoginService sharedService] loginWithMobile:_phoneNumTF.text PassWord:_passWordTF.text Handler:^(id object, NSError *err) {
        [self showMsg:object];
    }];
}

/**
 随便看看按钮点击事件
 */
- (IBAction)touristBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 忘记密码点击事件
 */
- (IBAction)forgetPassBtnClick:(UIButton *)sender {
}

/**
 三方登陆
 */
- (IBAction)oneLoginBtnClick:(UIButton *)sender {
}

/**
 三方登陆
 */
- (IBAction)twoLoginBtnClick:(UIButton *)sender {
}

/**
 三方登陆
 */
- (IBAction)threeLoginBtnClick:(UIButton *)sender {
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
