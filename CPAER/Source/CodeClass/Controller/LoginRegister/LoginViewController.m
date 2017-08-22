//
//  LoginViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/5/14.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "TYGValid.h"
#import "RegisterViewController.h"
#import "FindPassWordViewController.h"
#import "GetBasicInfo.h"
#import "BaseInfo.h"
#import "LCTabBarController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;//手机号
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _phoneNumTF.text = @"17621416776";
//    _passWordTF.text = @"123456";
    _phoneNumTF.text = @"15026997809";
    _passWordTF.text = @"111111";
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self hideTabBar];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillDisappear:animated];
}
/**
 登陆按钮点击事件
*/
- (IBAction)loginBtnClick:(UIButton *)sender {
    if(_phoneNumTF.text == nil || [_phoneNumTF.text isEqualToString:@""]){//手机号为空
        [self showMsg:@"请输入手机号"];
        return;
    }else if (![TYGValid isTelphoneNumber:_phoneNumTF.text]) {//如
        [self showMsg:@"请输入正确的手机号"];
        return;
    }else if (_passWordTF.text == nil || [_passWordTF.text isEqualToString:@""]){
        [self showMsg:@"请输入密码"];
        return;
    }
    [[LoginService sharedService] loginWithMobile:_phoneNumTF.text PassWord:_passWordTF.text Handler:^(id object, NSError *err) {
        if(!err){//请求成功
//            [self showMsg:object];//这个object不是NSString
//            NSLog(@"%@",object);
            [self P_getBaseUserInfo];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
/**
 注册
 */
- (IBAction)registerBtnClick:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegisterViewController *registerVC = [storyBoard instantiateViewControllerWithIdentifier:@"RegisterVC"];
    [self.navigationController pushViewController:registerVC animated:YES];
}
/**
 随便看看按钮点击事件
 */
- (IBAction)touristBtnClick:(UIButton *)sender {
    if ([_whereFrom isEqualToString:@"1"]) {//从首页过来的
        [self.navigationController popViewControllerAnimated:NO];
    }else if ([_whereFrom isEqualToString:@"2"]){//从个人中心主页过来
        LCTabBarController *a = (LCTabBarController*)self.tabBarController;
        UIView *view = a.mytabbar;
        UIButton *btn0 = [view viewWithTag:0];//
        btn0.selected = YES;
        UIButton *btn4 = [view viewWithTag:4];
        btn4.selected = NO;
        self.tabBarController.selectedIndex = 0;
    }
    
    
//    [self dismissViewControllerAnimated:NO completion:nil];
}

/**
 忘记密码点击事件
 */
- (IBAction)forgetPassBtnClick:(UIButton *)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FindPassWordViewController *findPassWordVC = [storyBoard instantiateViewControllerWithIdentifier:@"FindPassWordVC"];
    [self.navigationController pushViewController:findPassWordVC animated:YES];
}

/**
 微信登录
 */
- (IBAction)oneLoginBtnClick:(UIButton *)sender {
}

/**
 新浪微博登录
 */
- (IBAction)twoLoginBtnClick:(UIButton *)sender {
}

/**
 QQ登录
 */
- (IBAction)threeLoginBtnClick:(UIButton *)sender {
}

/**
 登录成功后获取用户详细信息
 */
- (void)P_getBaseUserInfo{
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"userId"];
    [[GetBasicInfo sharedService] getBaseInfoWithUserId:userId Handler:^(id object, NSError *err) {
        if(!err){//请求成功
//            NSLog(@"%@",object);
            [Tools logIn:object];
//            [self showMsg:@"登录成功"];
            [self showTabBar];
            [self.navigationController popViewControllerAnimated:NO];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
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
