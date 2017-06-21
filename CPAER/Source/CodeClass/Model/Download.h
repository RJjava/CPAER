//
//  Download.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Download : MTLModel<MTLJSONSerializing>

@property (nonatomic,readonly)NSInteger resourceId;

@property (nonatomic,copy,readonly)NSString *createUser;

@property (nonatomic,readonly)NSInteger downloadResourceId;

@property (nonatomic,copy,readonly)NSString *resourceBigimgUrl;

@property (nonatomic,copy,readonly)NSString *resourceSmallimgUrl;

@property (nonatomic,copy,readonly)NSString *resourceUrl;

@property (nonatomic,copy,readonly)NSString *resourceTitle;

@property (nonatomic, readonly) NSDate *publishAt;

@end
