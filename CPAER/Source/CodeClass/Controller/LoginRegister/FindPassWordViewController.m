//
//  FindPassWordViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/6/29.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "FindPassWordViewController.h"
#import "SendCodeService.h"
#import "ChangePWService.h"

@interface FindPassWordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;//手机号
@property (weak, nonatomic) IBOutlet UITextField *yanZhengMaTF;//验证码
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;//密码

@end

@implementation FindPassWordViewController

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
//获取验证码Btn点击事件
- (IBAction)getPassWordBtnClick:(id)sender {
    if(_phoneNumTF.text == nil || [_phoneNumTF.text isEqualToString:@""]){//手机号为空
        [self showMsg:@"请输入手机号"];
        return;
    }else if (![TYGValid isTelphoneNumber:_phoneNumTF.text]) {//如
        [self showMsg:@"请输入正确的手机号"];
        return;
    }
    [[SendCodeService sharedService] postForgotCodeWithMobile:_phoneNumTF.text Handler:^(id object, NSError *err) {
        if(!err){//请求成功
            //                [self showMsg:object];
            [self showMsg:@"发送成功"];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}
//确定修改密码Btn点击事件
- (IBAction)subBtnClick:(id)sender {
    if(_phoneNumTF.text == nil || [_phoneNumTF.text isEqualToString:@""]){//手机号为空
        [self showMsg:@"请输入手机号"];
        return;
    }else if (![TYGValid isTelphoneNumber:_phoneNumTF.text]) {//如
        [self showMsg:@"请输入正确的手机号"];
        return;
    }else if (_yanZhengMaTF.text == nil || [_yanZhengMaTF.text isEqualToString:@""]){//验证码为空
        [self showMsg:@"请输入验证码"];
        return;
    }else if (_passWordTF.text == nil || [_passWordTF.text isEqualToString:@""]){//验证码为空
        [self showMsg:@"请输入新密码"];
        return;
    }
    [[ChangePWService sharedService] forgetPasswordWithMobile:_phoneNumTF.text IdentifyCode:_yanZhengMaTF.text NewPW:_passWordTF.text Handler:^(NSError *err) {
        if(!err){//请求成功
            //                [self showMsg:object];
            [self showMsg:@"密码修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
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

//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
