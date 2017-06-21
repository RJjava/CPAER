//
//  Download.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Download.h"

@implementation Download

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"resourceId":@"id",
             @"createUser":@"createUser",
             @"downloadResourceId":@"downloadResourceId",
             @"resourceBigimgUrl":@"resourceBigimgUrl",
             @"resourceSmallimgUrl":@"resourceSmallimgUrl",
             @"resourceUrl":@"resourceUrl",
             @"resourceTitle":@"resourceTitle",
             @"publishAt":@"createTime"
             };
}

@end
