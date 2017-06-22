//
//  UserIdHttpClicent.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"

@implementation UserIdHttpClicent

- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))downloadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    NSString *sessionId = [self getUserId];
    if (!sessionId) {
        NSError *err = [NSError errorWithDomain:kDomainErrorBusinessLogic code:kWebServiceErrCodeInvalidUserId userInfo:nil];
        failure(nil, err);
        [self showLoginIfNeeded];
        return nil;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:parameters ?: @{}];
    [dict setObject:sessionId forKey:@"userId"];
    [dict setObject:@"0c8297d7-6d3a-46da-b782-0df2434f88b1" forKey:@"uuid"];
    
    return [super GET:URLString parameters:dict progress:downloadProgress success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    NSString *sessionId = [self getUserId];
    if (!sessionId) {
        NSError *err = [NSError errorWithDomain:kDomainErrorBusinessLogic code:kWebServiceErrCodeInvalidUserId userInfo:nil];
        failure(nil, err);
        [self showLoginIfNeeded];
        return nil;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:parameters ?: @{}];
    [dict setObject:sessionId forKey:@"userId"];
    
    return [super POST:URLString parameters:dict progress:uploadProgress success:success failure:failure];
}

- (NSString *)getUserId
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:@"userId"];
}

- (void)showLoginIfNeeded
{
    
}

@end
