//
//  ProvinceService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseHttpClient.h"
#import "Province.h"

@interface ProvinceService : BaseHttpClient

+ (instancetype)sharedService;

- (void)getSystemProvinceWithHandler:(completionArrayHandler)handler;

@end
