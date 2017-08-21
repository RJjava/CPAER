//
//  InfoModel.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/20.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface BaseInfo : MTLModel<MTLJSONSerializing>

/**
 * 属性：用户ID
 */
@property (nonatomic,copy)NSString *userId;

/**
 * 用户名
 */
@property (nonatomic,copy)NSString *userName;

/**
 * 登录Token
 */
@property (nonatomic,copy)NSString *loginToken;

/**
 * 资源服务器url
 */
@property (nonatomic,copy)NSString *resourceUrl;

/**
 * 真实姓名
 */
@property (nonatomic,copy)NSString *realName;

/**
 * 用户签名
 */
@property (nonatomic,copy)NSString *userSignature;

/**
 * 头像url
 */
@property (nonatomic,copy)NSString *headImgUrl;

/**
 * 生日
 */
@property (nonatomic,copy)NSString *birthday;

/**
 * 属性：科目ID
 */
@property (nonatomic,copy)NSString *subjectId;

/**
 * 属性：科目名称
 */
@property (nonatomic,copy)NSString *subjectName;

/**
 * 属性：科目简介
 */
@property (nonatomic,copy)NSString *subjectDesc;

/**
 * 属性：科目图标url
 */
@property (nonatomic,copy)NSString *subjectIcon;

/**
 * 属性：是否已选择
 */
@property (nonatomic,copy)NSString *enabled;

/**
 * 用户科目列表
 */
@property (nonatomic,copy)NSString *userSubjectList;




@end
