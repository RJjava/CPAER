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
    [self showLoginPrompt:@"游客您好，此功能登录后方可使用" from:nil];
}

- (void)showLoginPrompt:(NSString *)text from:(UIViewController *)sourceViewController
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }];
    // hack way to set message font, not suggested
    NSAttributedString *message = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    [alertVC setValue:message forKey:@"attributedMessage"];
    
    UIAlertAction *loginAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"LoginVC"];
        [sourceViewController presentViewController:loginVC animated:YES completion:nil];
    }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:loginAction];
    if (!sourceViewController) {
        sourceViewController = [((AppDelegate *)[UIApplication sharedApplication].delegate) window].rootViewController;
    }
    [sourceViewController presentViewController:alertVC animated:YES completion:nil];
}

@end
