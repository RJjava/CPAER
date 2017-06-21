//
//  Follow.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Follow : MTLModel<MTLJSONSerializing>

@property (nonatomic,readonly)NSInteger userId;

@property (nonatomic,copy,readonly)NSString *userName;

@property (nonatomic,copy,readonly)NSString *nickName;

@property (nonatomic,copy,readonly)NSString *realName;

@property (nonatomic, readonly) NSDate *publishAt;

@end
