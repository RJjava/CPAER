//
//  Answer.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Answer : MTLModel<MTLJSONSerializing>

@property (nonatomic,copy,readonly)NSString *answerContent;

@property (nonatomic,readonly)NSInteger questionId;

@property (nonatomic,readonly)NSInteger status;

@property (nonatomic,readonly)NSInteger userId;

@property (nonatomic,readonly)NSInteger answerId;

@property (nonatomic, readonly) NSDate *publishAt;

@end
