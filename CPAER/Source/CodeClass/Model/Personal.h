//
//  Personal.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Personal : MTLModel<MTLJSONSerializing>

@property (nonatomic,copy,readonly)NSString *nickName;

@property (nonatomic,copy,readonly)NSString *headImgUrl;

@property (nonatomic,copy,readonly)NSString *avaIntegralAmount;

@property (nonatomic,copy,readonly)NSString *followCount;

@property (nonatomic,copy,readonly)NSString *beFollowCount;

@end
