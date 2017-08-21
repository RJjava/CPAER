//
//  RegisterViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/5/7.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "RegisterViewController.h"
#import "SendCodeService.h"
#import "RegisterService.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *PhoneNumTF;//手机号
@property (weak, nonatomic) IBOutlet UITextField *VerificationCodeTF;//验证码
@property (weak, nonatomic) IBOutlet UITextField *PassWordTF;//密码
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;//同意协议Btn
@property (nonatomic, assign) BOOL isAgree;//是否同意协议


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isAgree = YES;
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
//发送验证码Btn点击事件
- (IBAction)sendRegisterCodeBtnClick:(UIButton *)sender {
    if(_PhoneNumTF.text == nil || [_PhoneNumTF.text isEqualToString:@""]){//手机号为空
        [self showMsg:@"请输入手机号"];
        return;
    }else if (![TYGValid isTelphoneNumber:_PhoneNumTF.text]){
        [self showMsg:@"请输入正确的手机号"];
        return;
    }
    [[SendCodeService sharedService] postRegisterCodeWithMobile:_PhoneNumTF.text Handler:^(id object, NSError *err) {
        if(!err){//请求成功
            //                [self showMsg:object];
            [self showMsg:@"发送成功"];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
}


//注册Btn点击事件
- (IBAction)RegisterBtnClick:(UIButton *)sender {
    if(_PhoneNumTF.text == nil || [_PhoneNumTF.text isEqualToString:@""]){//手机号为空
        [self showMsg:@"请输入手机号"];
        return;
    }else if (![TYGValid isTelphoneNumber:_PhoneNumTF.text]){
        [self showMsg:@"请输入正确的手机号"];
        return;
    }else if (_VerificationCodeTF.text == nil || [_VerificationCodeTF.text isEqualToString:@""]){//验证码为空
        [self showMsg:@"请输入验证码"];
        return;
    }else if (_PassWordTF.text == nil || [_PassWordTF.text isEqualToString:@""]){//密码为空
        [self showMsg:@"请输入密码"];
        return;
    }else if (!_isAgree){
        [self showMsg:@"请先同意用户协议"];
        return;
    }
    [[RegisterService sharedService] registerWithMobile:_PhoneNumTF.text IdentifyCode:_VerificationCodeTF.text PassWord:_PassWordTF.text UserType:@"1" Handler:^(id object, NSError *err) {
        if(!err){//请求成功
//            [self showMsg:object];
            [self showMsg:@"注册成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else{//请求失败
            [self showMsg:err.localizedDescription];
        }
    }];
    
}
//同意协议Btn点击事件
- (IBAction)agreeXYBtn:(id)sender {
    _isAgree = _isAgree ? NO : YES;
    [_agreeBtn setBackgroundImage:[UIImage imageNamed:_isAgree?@"tyxxZzh":@"btyxyZzh"] forState:UIControlStateNormal];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
