//
//  RegisterService.h
//  RealmTest
//
//  Created by 刘赞 on 2017/5/11.
//  Copyright © 2017年 stockstar. All rights reserved.
//

#import "BaseHttpClient.h"

@interface SendCodeService : BaseHttpClient

+ (instancetype)sharedService;

/**
 * 注册验证码
 */
- (void)postRegisterCodeWithMobile:(NSString *)mobile Handler:(completionObjectHandler)handler;

/**
 * 忘记密码验证码
 */
- (void)postForgotCodeWithMobile:(NSString *)mobile Handler:(completionObjectHandler)handler;

@end
