//
//  ChangeInfoService.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "ChangeInfoService.h"

@implementation ChangeInfoService

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)updateBaseInfoWithNickName:(NSString *)nickName
                     UserSignature:(NSString *)userSignature
                           Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_UpdateInfo];
    NSDictionary *dict = @{
                           @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                           @"userId":@"",
                           @"nickName":nickName,
                           @"userSignature":userSignature
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

@end
