//
//  GetBasicInfo.m
//  CPAER
//
//  Created by 朱智红 on 2017/8/17.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "GetBasicInfo.h"

@implementation GetBasicInfo

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getBaseInfoWithUserId:(NSString *)userId Handler:(completionObjectHandler)handler{
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_UserInfoDetail];
    NSDictionary *params = @{
                             @"uuid":@"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                             @"userId" : userId
                             };
    [self POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSDictionary *dataDic = [responseObject objectForKey:@"data"];
            NSMutableDictionary *baseInfoDic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            [baseInfoDic removeObjectForKey:@"data"];
            [baseInfoDic addEntriesFromDictionary:dataDic];
//            BaseInfo *model = [MTLJSONAdapter modelOfClass:[BaseInfo class] fromJSONDictionary:baseInfoDic error:nil];
            handler(baseInfoDic,nil);
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}

@end
