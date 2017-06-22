//
//  Personal.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Personal.h"

@implementation Personal

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"nickName":@"nickName",
             @"headImgUrl":@"headImgUrl",
             @"avaIntegralAmount":@"avaIntegralAmount",
             @"followCount":@"followCount",
             @"beFollowCount":@"beFollowCount",
             };
}

@end
