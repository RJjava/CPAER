//
//  InfoModel.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/20.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseInfo.h"

@implementation BaseInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userId":@"userId",
             @"userName":@"userName",
             @"loginToken":@"loginToken",
             };
}

@end
