//
//  RegisterService.m
//  RealmTest
//
//  Created by 刘赞 on 2017/5/11.
//  Copyright © 2017年 stockstar. All rights reserved.
//

#import "SendCodeService.h"

@implementation SendCodeService
{
    NSURLSessionDataTask *_RegisterCode;
    NSURLSessionDataTask *_ForgotCode;
}

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)postRegisterCodeWithMobile:(NSString *)mobile Handler:(completionObjectHandler)handler {
    [self cancelRegisterCode];
    _RegisterCode = [self getBussId:@"YHZC" Mobile:mobile handler:handler];
}

- (void)postForgotCodeWithMobile:(NSString *)mobile Handler:(completionObjectHandler)handler {
    [self cancelForgotCode];
    _ForgotCode = [self getBussId:@"WJMM" Mobile:mobile handler:handler];
}

- (NSURLSessionDataTask *)getBussId:(NSString *)bussId Mobile:(NSString *)mobile  handler:(completionObjectHandler)handler
{
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Sms];
    NSDictionary *param = @{
                            @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                            @"bussId" : bussId,
                            @"mobilePhone": mobile
                            };
    
    
    return [self POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSString *resultMsg = responseObject[@"resultMsg"];
            handler(resultMsg,nil);
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil, [self handleFailureBlockWithError:error]);
    }];
}

- (void)cancelRegisterCode {
    [_RegisterCode cancel];
}

- (void)cancelForgotCode {
    [_ForgotCode cancel];
}

@end
