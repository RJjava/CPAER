//
//  Sign.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/17.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SignIn : MTLModel<MTLJSONSerializing>

@property(nonatomic,assign,readonly)NSInteger signId;

@property(nonatomic,assign,readonly)NSInteger userId;

@property(nonatomic,assign,readonly)NSInteger signinDayIndex;

@property(nonatomic,copy,readonly)NSNumber *awardAmount;

@property(nonatomic,copy,readonly)NSString *signinDesc;

@property(nonatomic,copy,readonly)NSDate *publishAt;

@end

@interface Sign : MTLModel<MTLJSONSerializing>

@property(nonatomic,copy,readonly)NSString *isSignin;

@property(nonatomic,copy,readonly)NSString *signinDayIndex;

@property(nonatomic,copy,readonly)NSNumber *integralAwardAmount;

@property(nonatomic,copy,readonly)NSString *avaIntegralAmount;

@property(nonatomic,copy)NSArray<SignIn *> *list;

@end
