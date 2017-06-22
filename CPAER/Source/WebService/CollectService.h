//
//  CollectService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"
#import "Collect.h"

typedef NS_ENUM(NSInteger,collectType) {
    video = 1,
    audio  = 2,
    text   = 3
};

typedef enum : NSUInteger {
    disFollow,
    follow,
} isCollect;

@interface CollectService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)isCollectWithCollectType:(collectType)type
                   CollectValue:(NSInteger)collectId
                      isCollect:(isCollect)flag
                       Handler:(completionHandler)handler;

- (void)getCollectListWithCollectType:(collectType)type
                               skip:(NSInteger)skip
                            Handler:(completionInfiniteArrayHandler)handler;

@end
