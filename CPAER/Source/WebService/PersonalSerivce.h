//
//  PersonalSerivce.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"
#import "Personal.h"

@interface PersonalSerivce : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)getPersonalSpaceHandler:(completionObjectHandler)handler;

- (void)getIntegralAmountHandler:(completionObjectHandler)handler;

@end
