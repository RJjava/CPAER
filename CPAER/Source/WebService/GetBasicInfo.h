//
//  GetBasicInfo.h
//  CPAER
//
//  Created by 朱智红 on 2017/8/17.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseHttpClient.h"
#import "BaseInfo.h"

@interface GetBasicInfo : BaseHttpClient

+ (instancetype)sharedService;

- (void)getBaseInfoWithUserId:(NSString *)userId Handler:(completionObjectHandler)handler;

@end
