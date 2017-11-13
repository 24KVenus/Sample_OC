//
//  ModelHandler.h
//  VegetarianBoard
//
//  Created by 郭 奕杰 on 2017/2/5.
//  Copyright © 2017年 CCHT. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VBArticle.h"
#import "VBUser.h"
#import "VBComment.h"


@interface ModelHandler : NSObject
+ (VBArticle *)handleArticle:(NSDictionary *)articleDic;
+ (VBUser *)handleUserInfo:(NSDictionary *)userInfo;
+ (VBUser *)handleUserInfo:(NSDictionary *)userInfo userId:(NSString *)userId;
//处理评论
+ (VBComment *)handleComment:(NSDictionary *)conmmentDic;
@end
