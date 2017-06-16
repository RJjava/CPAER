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


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//发送验证码Btn点击事件
- (IBAction)sendRegisterCodeBtnClick:(UIButton *)sender {
    if(_PhoneNumTF.text == nil || [_PhoneNumTF.text isEqualToString:@""]){//手机号为空
        [self showMsg:@"请输入手机号"];
        return;
    }
        [[SendCodeService sharedService] postRegisterCodeWithMobile:_PhoneNumTF.text Handler:^(id object, NSError *err) {
            if(!err){//请求成功
                [self showMsg:object];
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
    }else if (_VerificationCodeTF.text == nil || [_VerificationCodeTF.text isEqualToString:@""]){//验证码为空
        [self showMsg:@"请输入验证码"];
        return;
    }else if (_PassWordTF.text == nil || [_PassWordTF.text isEqualToString:@""]){//密码为空
        [self showMsg:@"请输入密码"];
        return;
    }
    [[RegisterService sharedService] registerWithMobile:_PhoneNumTF.text IdentifyCode:_VerificationCodeTF.text PassWord:_PassWordTF.text UserType:@"1" Handler:^(id object, NSError *err) {
        if(!err){//请求成功
            [self showMsg:object];
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


- (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

@end
