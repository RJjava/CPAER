//
//  Tools.m
//  CPAER
//
//  Created by 朱智红 on 2017/8/8.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Tools.h"

@implementation Tools

//判断是否登录
+ (BOOL)isLogin{
    //保存用户的文件路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dicPath = [documentPath stringByAppendingPathComponent:@"userDic.plist"];
    //判断路径是否存在
    NSFileManager *fileM = [[NSFileManager alloc] init];
    if ([fileM fileExistsAtPath:dicPath]) {//如果存在该路径
        return YES;
    }
    return NO;
}
//登录（将用户信息以词典的形式保存到本地）
+ (void)logIn:(NSDictionary *)userDic{
    //设置写入路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dicPath = [documentPath stringByAppendingPathComponent:@"userDic.plist"];
    //写入文件 atomically表示是否在写入前用临时文件
    [userDic writeToFile:dicPath atomically:YES];
}
//获取本地存储的uer对象
+ (NSDictionary *)getUser{
    //设置读取文件的路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dicPath = [documentPath stringByAppendingPathComponent:@"userDic.plist"];
    //读取词典
    NSDictionary *getDic = [NSDictionary dictionaryWithContentsOfFile:dicPath];
    return getDic;
}
//登出
+ (void)logOut{
    //保存用户的文件路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dicPath = [documentPath stringByAppendingPathComponent:@"userDic.plist"];
    //判断路径是否存在
    NSFileManager *fileM = [[NSFileManager alloc] init];
    if ([fileM fileExistsAtPath:dicPath]) {//如果存在该路径则删除
        NSFileManager *fileM = [[NSFileManager alloc] init];
        [fileM removeItemAtPath:dicPath error:nil];
    }
}
//更新User，根据传入的词典的键值对修改
+ (void)updateUserInfoByDic:(NSDictionary *)updateDic{
    NSMutableDictionary *newUserDic = [[NSMutableDictionary alloc] initWithDictionary:[self getUser]];
    for (NSString *key in updateDic) {
        [newUserDic setValue:[updateDic objectForKey:key] forKey:key];
    }
    [self logOut];
    [self logIn:newUserDic];
}
/**
 词典去空值
 */
+ (NSDictionary *)removeNullFromDic:(NSDictionary *)dic{
    for (NSString *keyStr in [dic allKeys]) {
        if ([[dic objectForKey:keyStr] isEqual:[NSNull null]]) {
            [dic setValue:@"" forKey:keyStr];
        }
    }
    return dic;
}
+ (CGFloat)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    //[[[UIDevice currentDevice] systemVersion] doubleValue]可以获取到IOS版本号
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0) {
        //iOS7之后
        /*
         第一个参数: 预设空间 宽度固定  高度预设 一个最大值
         第二个参数: 行间距
         第三个参数: 属性字典 可以设置字体大小
         */
        NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
        CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine attributes:dict context:nil];
        //返回计算出的行高
        return rect.size.height;
    }else {
        //iOS7之前
        /*
         1.第一个参数  设置的字体固定大小
         2.预设 宽度和高度 宽度是固定的 高度一般写成最大值
         3.换行模式 字符换行
         */
        CGSize textSize = [text sizeWithFont:[UIFont systemFontOfSize:size] constrainedToSize:CGSizeMake(textWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
        return textSize.height;//返回 计算出得行高
    }
}


@end
