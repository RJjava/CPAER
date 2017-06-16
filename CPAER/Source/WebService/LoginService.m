//
//  LoginService.m
//  RealmTest
//
//  Created by 刘赞 on 2017/5/13.
//  Copyright © 2017年 stockstar. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)loginWithMobile:(NSString *)mobile PassWord:(NSString *)password Handler:(completionObjectHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Login];
    NSDictionary *params = @{
                             @"mobilePhone" : mobile,
                             @"password" : password
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
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}
//- (void)loginWithMobile:(NSString *)mobile PassWord:(NSString *)password Handler:(completionObjectHandler)handler {
//    [self cancelAllRequest];
//    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Login];
//    NSDictionary *params = @{
//                             @"mobilePhone" : mobile,
//                             @"password" : password
//                             };
//    [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //        NSError *err = [self handleFailureBlockWithError:responseObject];
//        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
//        if (!err) {
//            // to do
//        } else {
//            handler(nil,err);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        handler(nil,[self handleFailureBlockWithError:error]);
//    }];
//}

@end
