//
//  URLHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里是URL信息

#ifndef Project_URLHeader_h
#define Project_URLHeader_h

// 生产环境开发环境切换
#define PRODUCTION_MODE    0
//生产环境
#if PRODUCTION_MODE

#define URL_API @"http://121.43.103.88:8088/cpaerBackService/api/"

//测试环境
#else

#define URL_API @"http://121.43.103.88:8088/cpaerBackService/api/"

#endif

/** 3.1
 * 用户登录
 */
#define URL_Login @"user/userLogin"

/** 3.2
 * 用户注册
 */
#define URL_Register @"user/registerUser"

/** 3.3
 * 发送手机验证码
 */
#define URL_Sms @"smsNotice/sendIdentifyCode"



#endif
