//
//  URLHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里是URL信息

#ifndef Project_URLHeader_h
#define Project_URLHeader_h

// 生产环境开发环境切换
#define PRODUCTION_MODE    0
//生产环境
#if PRODUCTION_MODE

#define URL_API @"http://121.43.103.88:8088/cpaerBackService/api/"

//测试环境
#else

#define URL_API @"http://121.43.103.88:8088/cpaerBackService/api/"

#endif

/** 3.1
 * 用户登录
 */
#define URL_Login @"user/userLogin"

/** 3.2
 * 用户注册
 */
#define URL_Register @"user/registerUser"

/** 3.3
 * 发送手机验证码
 */
#define URL_Sms @"smsNotice/sendIdentifyCode"

/** 3.4
 * 修改密码
 */
#define URL_UpdatePW @"user/updatePassword"

/** 3.5
 * 修改密码
 */
#define URL_ForgetPW @"user/forgetPassword"

/** 3.6
 * 修改用户名(该接口暂不开放)
 */
#define URL_UpdateName @"user/updateUsername"

/** 3.7
 * 修改用户基本信息
 */
#define URL_UpdateInfo @"user/updateBasicInfo"

/** 3.8
 * 关注/取消关注
 */
#define URL_Follow @"follow/userFollow"

/** 3.9
 * 关注列表
 */
#define URL_FollowList @"follow/followList"

/** 3.10
 * 系统可下载资源文件列表
 */
#define URL_ResourceList @"resource/getDownResource"

/** 3.11
 * 保存/删除下载记录
 */
#define URL_UpdateUserDown @"userDownload/updateUserDownload"

/** 3.12
 * 用户已下载资源文件列表
 */
#define URL_UserDownList @"userDownload/getUserDownload"

/** 3.13
 * 收藏/取消收藏
 */
#define URL_Collect @"collect/userCollect"

/** 3.14
 * 收藏列表
 */
#define URL_CollectList @"collect/collectList"

/** 3.15
 * 发表提问
 */
#define URL_Ask @"question/publishQuestion"

/** 3.16
 * 回答提问
 */
#define URL_Reply @"question/replyQuestion"

/** 3.17
 * 给回答点赞/取消赞
 */
#define URL_Support @"question/supportUserAnswer"

/** 3.18
 * 采纳答案
 */
#define URL_UseUserAnswer @"question/useUserAnswer"

/** 3.19
 * 用户提问列表
 */
#define URL_QuestionList @"question/userQuestionList"

/** 3.20
 * 个人空间首页
 */
#define URL_PersonalSpace @"user/personalSpace"

/** 3.21
 * 获取可用积分
 */
#define URL_IntegralAmount @"account/getIntegralAmount"

/** 3.22
 * 获取用户账户交易流水
 */
#define URL_TransactionList @"account/getUserTransactionList"

/** 3.23
 * 获取系统省份列表
 */
#define URL_ProvinceList @"region/getSystemProvince"

/** 3.24
 * 获取系统参数列表
 */
#define URL_SystemParam @"systemParam/getSystemParam"

/** 3.25
 * 每日签到
 */
#define URL_Signin @"signin/userSignin"

/** 3.26
 * 签到详情
 */
#define URL_SigninDetail @"signin/getSigninDetail"

/** 3.27
 * 首页数据
 */
#define URL_FirstPage @"user/firstPage"

/** 3.28
 * 话题列表
 */
#define URL_TopicList @"group/getTopicList"

/** 3.29
 * 用户所选科目列表
 */
#define URL_UserSubject @"subject/getUserSubject"

/** 3.30
 * 获取章节列表
 */
#define URL_Charpter @"subject/getCharpter"

/** 3.31
 * 获取知识点列表
 */
#define URL_KnowPoint @"subject/getKnowPoint"

/** 3.32
 * 获取知识点详细信息
 */
#define URL_KnowPointDetail @"subject/getKnowPointDetail"

/** 3.33
 * 获取考卷列表
 */
#define URL_ExamPaperList @"exam/getExamPaperList"

/** 3.34
 * 获取考卷试题
 */
#define URL_ExamQuestion @"exam/getExamQuestion"

/** 3.39
 * 获取用户基本信息
 */
#define URL_UserInfoDetail @"user/getBasicInfo"

/** 3.43
 * 获取小组列表
 */
#define URL_GroupGetGroupList @"group/getGroupList"

/** 3.46
 * 给话题点赞/取消赞
 */
#define URL_GroupSupportTopic @"group/supportTopic"

/** 3.54
 * 推荐关注列表
 */
#define URL_RecommendFollowList @"follow/recommendFollowList"

#endif
