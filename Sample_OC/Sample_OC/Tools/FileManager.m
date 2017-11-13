//
//  FileManager.m
//  Sample
//
//  Created by Yijie Guo on 1/8/16.
//  Copyright © 2016 self. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

#pragma mark - 将图片以文件形式保存
//将图片以文件形式保存
//输入参数：image 要存储的图片对象
//      name 文件名
//输出参数：无
+ (void)saveImage:(UIImage *)image WithName:(NSString *)name {
    NSData *data = UIImagePNGRepresentation(image);
    [self saveFileData:data WithFileName:name];
}


#pragma mark - 保存文件
//保存文件
//输入参数：data 要存储的数据对象
//      name 文件名
//输出参数：无
+ (void)saveFileData:(NSData *)data WithFileName:(NSString *)name {
    NSError *error;
    NSString *filePath = [self filePathInDocuments:name];
    //[data writeToFile:fullPathToFile atomically:NO];
    [data writeToFile:filePath options:NSDataWritingAtomic error:&error];
    if (error) {
        MYLog(@"saveFile error %@", error);
    }
}

#pragma mark - 读取Documents中文件
//读取文件
//输入参数：fileName 要读取的文件名     image.png
//输出参数：data 读取都得数据
+ (NSData *)dataByReadFile:(NSString *)fileName {
    NSError *error;
    NSString *filePath = [self filePathInDocuments:fileName];
    NSData *data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
    if (error) {
        MYLog(@"readFile error %@", error);
        return nil;
    } else {
        return data;
    }
}

#pragma mark - 在Documents中，通过文件名获取文件路径
//通过文件名获取文件路径
//输入参数：fileName 文件名    image.png
//输出参数：filePath 文件路径  /Users/yijieguo/Library/Developer/CoreSimulator/Devices/B6A12E00-12B0-4281-B9F5-9C020B52046E/data/Containers/Data/Application/D39CFA24-D616-460E-818C-6C880521F561/Documents/image.png
+ (NSString *)filePathInDocuments:(NSString *)fileName {
    NSString *documentsPath = [self documentsFolderPath];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    return filePath;
}

#pragma mark - 获取Documents路径
//获取Documents路径
//输入参数：无
//输出参数：folderPath Documents文件夹路径  /Users/yijieguo/Library/Developer/CoreSimulator/Devices/B6A12E00-12B0-4281-B9F5-9C020B52046E/data/Containers/Data/Application/D39CFA24-D616-460E-818C-6C880521F561/Documents
+ (NSString *)documentsFolderPath {
    NSString *folderPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return folderPath;
}
@end
