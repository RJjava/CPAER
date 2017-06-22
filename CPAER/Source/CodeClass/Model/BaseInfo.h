//
//  InfoModel.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/20.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BaseInfo : MTLModel<MTLJSONSerializing>

@property (nonatomic,copy,readonly)NSString *userId;

@property (nonatomic,copy,readonly)NSString *userName;

@property (nonatomic,copy,readonly)NSString *loginToken;

@end
