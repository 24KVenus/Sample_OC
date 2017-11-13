//
//  HTTPRequestManager.m
//  Sample
//
//  Created by Yijie Guo on 1/7/16.
//  Copyright © 2016 self. All rights reserved.
//

#import "HTTPRequestManager.h"

@implementation HTTPRequestManager


//发送POST同步网络请求
+ (id)sendServerRequestWithInterface:(NSString *)interfaceString parameter:(NSString *)paramString {
    NSError *connectionError;
    NSError *JSONError;
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kIP, interfaceString];
    //生成URL
    NSURL *url = [NSURL URLWithString:urlStr];
    //生成请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.timeoutInterval = 10;
    request.HTTPMethod = @"POST";
    request.HTTPBody = [paramString dataUsingEncoding:NSUTF8StringEncoding];
    //发送同步请求
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&connectionError];
    NSString *str = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    MYLog(@"NSString response%@", str);
    if (connectionError) {
        MYLog(@"connectionError %@", connectionError);
        return nil;
    } else {
        //解析返回数据
        NSObject *obj = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&JSONError];
        if (JSONError) {
            MYLog(@"JSONError %@", JSONError);
            return nil;
        } else {
            return obj;
        }
    }
}

//发送Get同步网络请求
+ (id)sendGetServerRequestWithInterface:(NSString *)interfaceString parameter:(NSString *)paramString {
    NSError *connectionError;
    NSError *JSONError;
    //拼装IP地址
    NSString *urlStr = [NSString stringWithFormat:@"%@%@?%@",kIP, interfaceString, paramString];
    //    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kIP_Production, interfaceString];
    //生成URL
    MYLog(@"url %@", urlStr);
    MYLog(@"paramString %@", paramString);
    NSURL *url = [NSURL URLWithString:urlStr];
    //生成请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //发送同步请求
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&connectionError];
    //    MYLog(@"NSData response %@", response);
    if (connectionError) {
        MYLog(@"connectionError %@", connectionError);
        return connectionError;
    } else {
        //解析返回数据
        NSObject *obj = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&JSONError];
        if (JSONError) {
            MYLog(@"JSONError %@", JSONError);
            return nil;
        } else {
            return obj;
        }
    }
}
//发送POST异步网络请求
+ (void)sendAsynchronousServerRequestWithInterface:(NSString *)interfaceString parameter:(NSString *)paramString completionHandler:(void(^)(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError)) completionHandler {
    //拼装IP地址
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kIP, interfaceString];
    //    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kIP_Production, interfaceString];
    //生成URL
    MYLog(@"url %@", urlStr);
    MYLog(@"paramString %@", paramString);
    NSURL *url = [NSURL URLWithString:urlStr];
    //生成请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:20];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [paramString dataUsingEncoding:NSUTF8StringEncoding];
    //    MYLog(@"HTTPBody %@", [paramString dataUsingEncoding:NSUTF8StringEncoding]);
    NSOperationQueue *queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:completionHandler];
}

- (void)uploadPortraitWitInterface:(NSString *)interfaceString fileName:(NSString *)fileName filePath:(NSString *)filePath{
    NSString *identifier = @"Portrait";
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kIP, interfaceString];
    MYLog(@"urlStr %@", urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    NSMutableData *body = [NSMutableData data];
    //1
    NSString *startStr = [NSString stringWithFormat:@"--%@\r\n", identifier];
    NSData *startData = [startStr dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:startData];
    //2
    NSString *fullPath = [filePath stringByAppendingPathComponent:fileName];
    NSString *disposition = [NSString stringWithFormat:@"Content-Disposition:form-data;name=\"file\";filename=\"%@\"\r\n", filePath];
    NSData *dispositionData = [disposition dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:dispositionData];
    //3
    NSString *type = [NSString stringWithFormat:@"Content-Type:image/png\r\n"];
    NSData *typeData = [type dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:typeData];
    //4
    NSData *d = [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:d];
    //5
    UIImage *image = [UIImage imageWithContentsOfFile:fullPath];
    NSData *imageData = UIImagePNGRepresentation(image);
    [body appendData:imageData];
    //6
    [body appendData:d];
    //7
    NSString *endStr = [NSString stringWithFormat:@"--%@--\r\n", identifier];
    NSData *endData = [endStr dataUsingEncoding:NSUTF8StringEncoding];
    [body appendData:endData];
    //8
    request.HTTPBody = body;
    //9
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)body.length] forHTTPHeaderField:@"Content-Length"];
    //10
    [request setValue:@"multipart/form-data;boundary=Portrait" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"UTF-8" forHTTPHeaderField:@"Charset"];
    //11
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        } else {
            MYLog(@"connectionError %@", connectionError);
        }
    }];
}


#warning Serialize XML Data
//+ (void)parseXMLData:(NSData *)data delegate:(id)delegate {
//    NSXMLParser *parse = [[NSXMLParser alloc] initWithData:data];
//    parse.delegate = delegate;
//    [parse parse];
//}

//解析JSON数据
+ (id)serializeJSONData:(NSData *)data {
    NSError *error;
    NSObject *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        return error;
    } else {
        return obj;
    }
}

//将字典转为JSON数据
+ (id)dataWithJSONObject:(NSDictionary *)dictionary {
    NSError *error;
     NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return error;
    } else {
        return data;
    }
}
//使用NSURLConnection发送同步请求
+ (NSData *)NSURLConnectionSendSynchronousRequest:(NSMutableURLRequest *)request {
    NSError *connectionError;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&connectionError];
    if (connectionError) {
        MYLog(@"connectionError %@", connectionError);
        return nil;
    } else {
        return responseData;
    }
}
//使用NSURLConnection发送异步请求
+ (void)NSURLConnectionSendAsynchronousRequest:(NSMutableURLRequest *)request completionHandler:(void (^)(NSURLResponse* __nullable response, NSData* __nullable data, NSError* __nullable connectionError)) handler {
    [NSURLConnection  sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        handler(response, data, connectionError);
    }];
}
//使用NSURLSession发送异步请求
//使用NSURLSession进行GET或POST的异步请求，参数get值为YES时，发送GET异步请求，参数get值为NO时，发送POST异步请求
+ (void)sendRequestWithInterface:(NSString *)interfaceString parameter:(NSString *)paramString inGetMethod:(BOOL)get completionHandler:(void (^)(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error))completionHandler
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kIP, interfaceString];
    //    MYLog(@"urlStr %@", urlStr);
    //生成URL
    NSURL *url = [NSURL URLWithString:urlStr];
    //生成请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if (get) {
        NSString *getUrlStr = [NSString stringWithFormat:@"%@?%@", urlStr, paramString];
        request.URL = [NSURL URLWithString:getUrlStr];
    } else {
        request.HTTPMethod = @"POST";
        request.HTTPBody = [paramString dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc] init];
    task = [session dataTaskWithRequest:request completionHandler:completionHandler];
    [task resume];
}

+ (void)sendRequestWithInterface:(NSString *)interfaceString parameter:(NSString *)paramString inGetMethod:(BOOL)get dateCompletionHandler:(void (^)(NSData * __nullable data))completionHandler
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kIP, interfaceString];
    //    MYLog(@"urlStr %@", urlStr);
    //生成URL
    NSURL *url = [NSURL URLWithString:urlStr];
    //生成请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if (get) {
        NSString *getUrlStr = [NSString stringWithFormat:@"%@?%@", urlStr, paramString];
        request.URL = [NSURL URLWithString:getUrlStr];
    } else {
        request.HTTPMethod = @"POST";
        request.HTTPBody = [paramString dataUsingEncoding:NSUTF8StringEncoding];
    }
//    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleFade];
//    [MMProgressHUD show];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [[NSURLSessionDataTask alloc] init];
    task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //        [MMProgressHUD dismiss];
        if (error) {
            MYLog(@"err %@", error);
        } else {
            completionHandler(data);
        }
    }];
    [task resume];
}


//AFNetwork
//获取Documents路径
- (NSString *)documentFolderPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}


//通过URL下载图片
+ (void)downloadImageInImageView:(UIImageView *)imageView urlString:(NSString *)urlStr defaulImageName:(NSString *)imageName {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *data = [NSData dataWithContentsOfURL:url];
        //    MYLog(@"data %@", data);
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                imageView.image = [UIImage imageWithData:data];
            } else {
                imageView.image = [UIImage imageNamed:imageName];
            }
        });
    });
}





@end
