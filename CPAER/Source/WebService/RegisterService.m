//
//  RegisterService.m
//  RealmTest
//
//  Created by 刘赞 on 2017/5/13.
//  Copyright © 2017年 stockstar. All rights reserved.
//

#import "RegisterService.h"

@implementation RegisterService

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)registerWithMobile:(NSString *)mobile IdentifyCode:(NSString *)code PassWord:(NSString *)password UserType:(NSString *) usertype Handler:(completionObjectHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Register];
    NSDictionary *params = @{
                            @"mobilePhone" : mobile,
                            @"identifyCode" : code,
                            @"password" : password,
                            @"userType" : usertype,
                            @"platform" : @"IOS"
                            };
    [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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

@end
