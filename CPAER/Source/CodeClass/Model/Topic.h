//
//  Topic.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/17.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Topic : MTLModel<MTLJSONSerializing>

@property(nonatomic,copy,readonly)NSDate *publishAt;

@property(nonatomic,copy,readonly)NSString *groupName;

@property(nonatomic,copy,readonly)NSString *topicTitle;

@property(nonatomic,copy,readonly)NSNumber *clickCount;

@property(nonatomic,copy,readonly)NSString *topicContent;

@end
