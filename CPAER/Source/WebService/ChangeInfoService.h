//
//  ChangeInfoService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseHttpClient.h"

@interface ChangeInfoService : BaseHttpClient

+ (instancetype)sharedService;

- (void)updateBaseInfoWithNickName:(NSString *)nickName
                     UserSignature:(NSString *)userSignature
                           Handler:(completionHandler)handler;

@end
