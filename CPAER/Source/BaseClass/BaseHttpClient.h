//
//  BaseHttpClient.h
//  LiveRoom
//
//  Created by 刘赞 on 16/8/11.
//  Copyright © 2016年 StockStar. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
//#import "URLHeader.h"
//#import "URLService.h"
//#import "WebServiceErrCode.h"

/**
 Define domain error
 */
#define kDomainErrorNetwork         @"domainErrorNetwork"
#define kDomainErrorBusinessLogic   @"domainErrorBusinessLogic"


typedef void (^completionHandler)(NSError *err);
typedef void (^completionObjectHandler)(id object, NSError *err);
typedef void (^completionArrayHandler)(NSArray *, NSError *err);
typedef void (^completionInfiniteArrayHandler)(NSArray *, BOOL isFinished, NSError *err);


@interface BaseHttpClient : AFHTTPSessionManager

/**
 Involve this method ever in success block
 If busniess logic is correct, returns nil
 */
- (NSError *)handleSuccessBlockWithResponse:(NSDictionary *)response;

/**
 Involve this method ever in failure block
 */
//- (NSError *)handleFailureBlock;

- (NSError *)handleFailureBlockWithError:(NSError *)err;

/**
 Cancel All Request
 */
- (void)cancelAllRequest;

/**
 Paging size
 Default is 10
 Override to supply a custom size
 */
- (NSUInteger)size;

@end
