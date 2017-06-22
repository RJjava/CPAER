//
//  TransactionService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"
#import "Transaction.h"

typedef NS_ENUM(NSInteger,accountType) {
    ZJZH = 0,
    JFZH = 1
};

typedef NS_ENUM(NSInteger,tranType) {
    JFTW = 0,
};

@interface TransactionService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)getUserTransactionListFromSkip:(NSInteger)skip AccountType:(accountType)type TranType:(tranType)tranType tranProcessCode:(NSString *)code startDate:(NSDate *)startDate endDate:(NSDate *)endDate Handler:(completionInfiniteArrayHandler)handler;

@end
