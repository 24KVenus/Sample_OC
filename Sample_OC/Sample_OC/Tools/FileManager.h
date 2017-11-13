//
//  FileManager.h
//  Sample
//
//  Created by Yijie Guo on 1/8/16.
//  Copyright © 2016 self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
//将图片以文件形式保存
+ (void)saveImage:(UIImage *)image WithName:(NSString *)name;
//保存文件
+ (void)saveFileData:(NSData *)data WithFileName:(NSString *)name;
//读取文件
+ (NSData *)dataByReadFile:(NSString *)fileName;
//通过文件名获取文件路径
+ (NSString *)filePathInDocuments:(NSString *)fileName;
//获取Documents路径
+ (NSString *)documentsFolderPath;
@end
