//
//  ProvinceService.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "ProvinceService.h"

@implementation ProvinceService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getSystemProvinceWithHandler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_ProvinceList];
    NSDictionary *dict = @{
                           @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Province class] fromJSONArray:json error:nil];
            handler(list,nil);
        } else {
            handler(nil, err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil, [self handleFailureBlockWithError:error]);
    }];
}

@end
