//
//  APPHeader.h
//  ProjectMusic
//
//  Created by young on 15/7/31.
//  Copyright (c) 2015年 young. All rights reserved.
//  这里存放普通的app宏定义和声明等信息.

#ifndef Project_APPHeader_h
#define Project_APPHeader_h

//获取 屏幕的大小
#define kScreenSize [UIScreen mainScreen].bounds.size

/**
 * 当前设备的屏幕宽高
 */
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height

/**
 * 当前设备的屏幕X
 */
#define SCREEN_X   [[UIScreen mainScreen] bounds].origin.x

/**
 * 当前设备的屏幕Y
 */
#define SCREEN_Y   [[UIScreen mainScreen] bounds].origin.y

#define PxWidth7P (kScreenWidth*1.0/414)
#define PxHeight7P (kScreenHeight*1.0/736)

/**
 * TabBar选中颜色#18ddff:24.221.255
 */
#define Color_BaseColor  [UIColor colorWithRed:24/255.0 green:221/255.0 blue:255/255.0 alpha:1.0]

/**
 * TabBar选中颜色#00ccff:0.204.255
 */
#define Color_TabBarSelectColor  [UIColor colorWithRed:0/255.0 green:204/255.0 blue:255/255.0 alpha:1.0]

/**
 * TabBar未选中颜色#777777:119.119.119
 */
#define Color_TabBarUnSelectColor  [UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1.0]





















































//TODO 提示
#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用下面的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


#endif
