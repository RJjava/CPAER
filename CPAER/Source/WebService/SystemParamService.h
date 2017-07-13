//
//  SystemParamService.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/11.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"
#import "Param.h"

@interface SystemParamService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)getSystemParamWithDicCode:(NSString *)code Handler:(completionArrayHandler)handler;

@end
