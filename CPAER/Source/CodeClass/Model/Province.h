//
//  Province.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Province : MTLModel<MTLJSONSerializing>

@property (nonatomic,copy,readonly)NSString *provinceId;

@property (nonatomic,copy,readonly)NSString *provinceName;

@property (nonatomic,copy,readonly)NSString *provinceEn;

@end
