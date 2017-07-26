//
//  Param.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/11.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Param : MTLModel<MTLJSONSerializing>

@property (nonatomic,copy,readonly)NSString *dtyCode;

@property (nonatomic,copy,readonly)NSString *dicCode;

@property (nonatomic,copy,readonly)NSString *dicName;

@end
