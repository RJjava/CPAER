//
//  FollowService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseHttpClient.h"
#import "Follow.h"

typedef NS_ENUM(NSInteger,followType) {
    followUser = 1,
};

typedef NS_ENUM(NSInteger,followUserType) {
    student = 1,
    coach = 2
};

typedef enum : NSUInteger {
    disFollow,
    follow,
} isFollow;

@interface FollowService : BaseHttpClient

+ (instancetype)sharedService;

- (void)isFollowWithFollowType:(followType)type
                   FollowValue:(NSInteger )followId
                      isFollow:(isFollow)flag
                       Handler:(completionHandler)handler;

- (void)getFollowListWithFollowType:(followType)type
                     followUserType:(followUserType)userType
                               skip:(NSInteger)skip
                            Handler:(completionInfiniteArrayHandler)handler;

@end
