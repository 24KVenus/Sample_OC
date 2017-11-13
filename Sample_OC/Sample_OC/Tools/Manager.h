//
//  Manager.h
//  ShopOfSupplyChain
//
//  Created by Yijie Guo on 2/16/16.
//  Copyright © 2016 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

//显示提示信息
+ (void)showAlertMessage:(NSString *)message inViewController:(UIViewController *)viewController;
+ (void)showAlertMessage:(NSString *)message;

//判断是否有网络链接
+ (BOOL)isNetworkAvailable;


@end
