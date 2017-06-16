//
//  BaseHttpClient.m
//  LiveRoom
//
//  Created by 刘赞 on 16/8/11.
//  Copyright © 2016年 StockStar. All rights reserved.
//

#import "BaseHttpClient.h"
#include <ifaddrs.h>
#include <arpa/inet.h>

@implementation BaseHttpClient

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
//        [self.requestSerializer setValue:@"text/html" forHTTPHeaderField:@"Content-type"];
    }
    return self;
}


- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))downloadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    NSDictionary *params = [self requestParamsForDictionary:parameters];
    return [super GET:URLString parameters:params progress:downloadProgress success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    NSDictionary *params = [self requestParamsForDictionary:parameters];
    return [super POST:URLString parameters:params progress:uploadProgress success:success failure:failure];
}

- (void)cancelAllRequest
{
    [self.operationQueue cancelAllOperations];
    for (NSURLSessionTask *task in self.tasks) {
        [task cancel];
    }
}


- (NSUInteger)size
{
    return 10;
}

#pragma mark -

- (NSError *)handleSuccessBlockWithResponse:(NSDictionary *)response
{
    int retValue = [[response objectForKey:@"resultCode"] intValue];
    if (retValue == 1) {
        return nil;
    }
    return [NSError errorWithDomain:kDomainErrorBusinessLogic code:retValue userInfo:@{
                                                                                         NSLocalizedDescriptionKey : [response objectForKey:@"resultMsg"]
                                                                                         }];
}


- (NSError *)handleFailureBlockWithError:(NSError *)err
{
    if (err.code == NSURLErrorCancelled) {
        NSError *error = [NSError errorWithDomain:kDomainErrorNetwork code:NSURLErrorCancelled userInfo:@{
                                                                                                          NSLocalizedDescriptionKey : @""
                                                                                                          }];
        return error;
    } else {
        return err;
    }
}

#pragma mark - Utils

- (NSDictionary *)requestParamsForDictionary:(NSDictionary *)dict
{
    NSMutableDictionary *params = [NSMutableDictionary alloc];
    params = @{
               @"paramJson" : [self dictionaryToJson:dict]
               }.mutableCopy;
    return params.copy;
}

-(NSString *)dictionaryToJson:(NSDictionary *)dic
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSString *)getLocalIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

@end
