//
//  AppManager.h
//  Sample
//
//  Created by 郭 奕杰 on 16/7/28.
//  Copyright © 2016年 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppManager : NSObject
//获取APP名称
+ (NSString *)appBundleName;
//获取APP版本号
+ (NSString *)appBundleShortVersion;
@end
