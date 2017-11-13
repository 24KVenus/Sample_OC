//
//  ModelHandler.m
//  VegetarianBoard
//
//  Created by 郭 奕杰 on 2017/2/5.
//  Copyright © 2017年 CCHT. All rights reserved.
//

#import "ModelHandler.h"

@implementation ModelHandler
+ (VBArticle *)handleArticle:(NSDictionary *)articleDic {
    VBArticle *article = [[VBArticle alloc] initWithArticleInfo:articleDic];
    [HTTPRequestManager downloadImageWithArticle:article];
    return article;
}

+ (VBUser *)handleUserInfo:(NSDictionary *)userInfo {
    VBUser *user = [[VBUser alloc] initWithUserInfo:userInfo];
    [HTTPRequestManager downloadImageWithUser:user];
    return user;
}

+ (VBUser *)handleUserInfo:(NSDictionary *)userInfo userId:(NSString *)userId {
    VBUser *user = [[VBUser alloc] initWithUserInfo:userInfo userId:userId];
    [HTTPRequestManager downloadImageWithUser:user];
    return user;
}

//处理评论
+ (VBComment *)handleComment:(NSDictionary *)conmmentDic {
    VBComment *comment = [[VBComment alloc] initWithInfo:conmmentDic];
    return comment;
}

@end
