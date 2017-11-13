//
//  AppManager.m
//  Sample
//
//  Created by 郭 奕杰 on 16/7/28.
//  Copyright © 2016年 self. All rights reserved.
//

#import "AppManager.h"

@implementation AppManager

//获取APP名称
+ (NSString *)appBundleName {
    NSDictionary *appInfoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appBundleName = [appInfoDic objectForKey:@"CFBundleName"];
    
    return appBundleName;
}

//获取APP版本号
+ (NSString *)appBundleShortVersion {
    NSDictionary *appInfoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = appInfoDic[@"CFBundleShortVersionString"];
    return appVersion;
}


@end
