//
//  SignIn.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/11.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"

@interface SignInService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)userSignInWithHandler:(completionObjectHandler)handler;

- (void)getSignDetailWithHandler:(completionObjectHandler)handler;

@end
