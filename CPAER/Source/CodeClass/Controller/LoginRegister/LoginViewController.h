//
//  LoginViewController.h
//  CPAER
//
//  Created by 姜云亭 on 2017/5/14.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

//记录从什么页面跳转过来的
//1,从首页
//2,个人中心主页
@property (nonatomic, strong) NSString *whereFrom;

@end
