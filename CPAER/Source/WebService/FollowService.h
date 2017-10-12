//
//  FollowService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"


@interface FollowService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)isFollowWithFollowType:(NSString *)type
                   FollowValue:(NSString *)followId
                      isFollow:(NSString *)flag
                       Handler:(completionHandler)handler;

- (void)getFollowListWithFollowType:(NSString *)type
                     followUserType:(NSString *)userType
                       searchCondit:(NSString *)searchCondit
                               skip:(NSString *)skip
                            Handler:(completionObjectHandler)handler;

@end
