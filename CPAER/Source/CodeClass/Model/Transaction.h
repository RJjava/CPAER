//
//  Transaction.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Transaction : MTLModel<MTLJSONSerializing>

@property (nonatomic,readonly)NSInteger tranId;

@property (nonatomic,copy,readonly)NSString *changeAmount;

@property (nonatomic,copy,readonly)NSString *balance;

@property (nonatomic,copy,readonly)NSString *tranType;

@property (nonatomic,copy,readonly)NSString *tranDesc;

@property (nonatomic, readonly) NSDate *publishAt;

@end
