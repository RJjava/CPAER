//
//  TransactionService.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "TransactionService.h"

@implementation TransactionService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getUserTransactionListFromSkip:(NSInteger)skip
                           AccountType:(accountType)type
                              TranType:(tranType)tranType
                       tranProcessCode:(NSString *)code
                             startDate:(NSDate *)startDate
                               endDate:(NSDate *)endDate
                               Handler:(completionInfiniteArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_TransactionList];
    NSString *type1 = [self accountType:type];
    NSString *type2 = [self tranType:tranType];
    NSDictionary *dict = @{
                           @"accountType":type1,
                           @"tranType":type2,
                           @"tranProcessCode":code,
                           @"startDate":startDate,
                           @"endDate":endDate,
                           @"curPage":@(skip),
                           @"maxLine":@([self size]),
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Transaction class] fromJSONArray:json error:nil];
            handler(list,list.count < [self size],nil);
        } else {
            handler(nil,NO, err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,NO, [self handleFailureBlockWithError:error]);
    }];
}

- (NSString *)accountType:(accountType)type {
    if (type == 0) {
        return @"ZJZH";
    }
    return @"JFZH";
}

- (NSString *)tranType:(tranType)tranType {
    return @"JFTW";
}

@end
