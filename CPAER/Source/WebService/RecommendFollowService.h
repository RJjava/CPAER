//
//  RecommendFollowService.h
//  CPAER
//
//  Created by 朱智红 on 2017/8/24.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"

@interface RecommendFollowService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)getRecommendFollowListBySearchCondit:(NSString *)searchCondit
                   followUserType:(NSString *)followUserType
                      curPage:(NSString *)curPage
                        maxLine:(NSString *)maxLine
                       Handler:(completionObjectHandler)handler;

@end
