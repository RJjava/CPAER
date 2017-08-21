//
//  Tools.h
//  CPAER
//
//  Created by 朱智红 on 2017/8/8.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject

//判断是否登录
+ (BOOL)isLogin;
//登录（将用户信息以词典的形式归档到本地）
+ (void)logIn:(NSDictionary *)userDic;
//获取本地存储的uer对象（字典）
+ (NSDictionary *)getUser;
//登出
+ (void)logOut;
//更新User，根据传入的词典的键值对修改
+ (void)updateUserInfoByDic:(NSDictionary *)updateDic;
/**
 词典去空值
 */
+ (NSDictionary *)removeNullFromDic:(NSDictionary *)dic;
/**
 根据字符串内容的多少  在固定宽度 下计算出实际的行高
 */
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size;

@end
