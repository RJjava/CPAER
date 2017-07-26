//
//  SystemParamService.m
//  CPAER
//
//  Created by 刘赞 on 2017/7/11.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "SystemParamService.h"

@implementation SystemParamService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getSystemParamWithDicCode:(NSString *)code Handler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_SystemParam];
    NSDictionary *dict = @{
                           @"dtyCode":code
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Param class] fromJSONArray:json error:nil];
            handler(list,nil);
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}

@end
