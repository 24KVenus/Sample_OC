//
//  DeviceManager.m
//  VegetarianBoard
//
//  Created by 郭 奕杰 on 2017/1/5.
//  Copyright © 2017年 CCHT. All rights reserved.
//

#import "DeviceManager.h"
#import "sys/utsname.h"
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>


#define VBNULL @"VBNULL"


@implementation DeviceManager


+ (void)updateDeviceInfoWithParamString:(NSString *)param {
    MYLog(@"***************updateDeviceInfo****************");
    [HTTPRequestManager deviceWithParamString:param completionHandler:^(NSObject *object, NSString *status) {
//        MYLog(@"updateDeviceInfo object %@", object);
        MYLog(@"updateDeviceInfo status %@ msg %@", status, ((NSDictionary *)object)[@"msg"]);
    }];
}

//设备名称
+ (NSString *)deviceName {
//    MYLog(@"deviceName %@", [[UIDevice currentDevice] name]);
    return [[UIDevice currentDevice] name];
}

+ (NSString *)deviceModel {
//    MYLog(@"deviceModel %@", [[UIDevice currentDevice] model]);
    return [[UIDevice currentDevice] model];
}

+ (NSString *)deviceLocalizedModel {
//    MYLog(@"deviceLocalizedModel %@", [[UIDevice currentDevice] localizedModel]);
    return [[UIDevice currentDevice] localizedModel];
}

+ (NSString *)deviceUUID {
//    MYLog(@"deviceUUID %@", [[[UIDevice currentDevice] identifierForVendor] UUIDString]);
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (NSString *)deviceSystemName {
//    MYLog(@"deviceSystemName %@", [[UIDevice currentDevice] systemName]);
    return [[UIDevice currentDevice] systemName];
}
+ (NSString *)deviceSystemVersion {
//    MYLog(@"deviceSystemVersion %@", [[UIDevice currentDevice] systemVersion]);
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)deviceVersion {

    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    
    NSString *deviceVersion;
    
    if ([deviceString isEqualToString:@"iPhone1,1"]) deviceVersion = @"iPhone1G";
    if ([deviceString isEqualToString:@"iPhone1,2"]) deviceVersion = @"iPhone3G";
    if ([deviceString isEqualToString:@"iPhone2,1"]) deviceVersion = @"iPhone3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"]) deviceVersion = @"iPhone4";
    if ([deviceString isEqualToString:@"iPhone3,2"]) deviceVersion = @"Verizon iPhone4";
    if ([deviceString isEqualToString:@"iPhone4,1"]) deviceVersion = @"iPhone4S";
    if ([deviceString isEqualToString:@"iPhone5,1"]) deviceVersion = @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,2"]) deviceVersion = @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,3"]) deviceVersion = @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone5,4"]) deviceVersion = @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone6,1"]) deviceVersion = @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone6,2"]) deviceVersion = @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone7,1"]) deviceVersion = @"iPhone6Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"]) deviceVersion = @"iPhone6";
    if ([deviceString isEqualToString:@"iPhone8,1"]) deviceVersion = @"iPhone6s";
    if ([deviceString isEqualToString:@"iPhone8,2"]) deviceVersion = @"iPhone6sPlus";
//    MYLog(@"deviceVersion %@", deviceVersion);
//    if (deviceVersion == nil) {
//        return deviceString;
//    } else {
//        return deviceVersion;
//    }
//    MYLog(@"deviceString %@", deviceString);
    return deviceString;
}

//获取网络类型
+ (NSInteger)networkType {
    NSArray *subviews = [[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSNumber *dataNetworkItemView = nil;
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            dataNetworkItemView = subview;
            break;
        }
    }
//    MYLog(@"networkType %ld", [[dataNetworkItemView valueForKey:@"dataNetworkType"] integerValue]);
    return [[dataNetworkItemView valueForKey:@"dataNetworkType"] integerValue];
}

//获取运营商信息
+ (NSString *)carrierInfo {
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *carrierName = [carrier carrierName];
//    MYLog(@"carrierName %@", carrierName);
    return carrierName;
//    NSLog(@"[carrier isoCountryCode]==%@,[carrier allowsVOIP]=%d,[carrier mobileCountryCode=%@,[carrier mobileNetworkCode]=%@ %@",[carrier isoCountryCode],[carrier allowsVOIP],[carrier mobileCountryCode],[carrier mobileNetworkCode], currentCountry);
}

//获取ip地址
+ (NSString *)ipAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0)
    {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL)
        {
            if(temp_addr->ifa_addr->sa_family == AF_INET)
            {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
                {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
//    MYLog(@"ipAdress %@",address);
    return address;
}

+ (NSString *)UMengDeviceToken {
//    MYLog(@"UMengDeviceToken %@", kUD_ObjectForKey(kUDK_Token_UMeng));
    return kUD_ObjectForKey(kUDK_Token_UMeng);
}




+ (NSString *)handleNetworkType:(NSInteger)networkType {
    NSString *network;
    switch (networkType) {
        case 0:// No wifi or cellular
            network = @"0";
            break;
        case 1://2G
            network = @"2";
            break;
        case 2://3G
            network = @"3";
            break;
        case 3://4G
            network = @"4";
            break;
        case 4://LTE
            network = @"5";
            break;
        case 5://Wifi
            network = @"1";
            break;
        default://
            network = @"0";
            break;
    }
    return network;
}

+ (NSString *)handleCarrierName:(NSString *)carrierName {
    NSString *name;
    if ([carrierName isEqualToString:@"中国联通"]) {
        name = @"2";
    } else if ([carrierName isEqualToString:@"中国移动"]) {
        name = @"1";
    } else if ([carrierName isEqualToString:@"中国电信"]) {
        name = @"3";
    } else {
        name = @"0";
    }
    return name;
}



+ (void)updataDeviceInfo {
    
    NSString *userId = kUD_ObjectForKey(kUDK_User_ID);
    NSString *umengToken = kUD_ObjectForKey(kUDK_Token_UMeng);
    NSString *latitude = kUD_ObjectForKey(kUDK_Latitude);
    NSString *longitude = kUD_ObjectForKey(kUDK_Longitude);
    
    NSString *carrierName = [self handleCarrierName:[self carrierInfo]];
    NSString *networkType = [self handleNetworkType:[self networkType]];
    NSString *ipAdress = [self ipAddress];
    
    NSString *systemVersion = [self deviceSystemVersion];
    NSString *systemName = [self deviceSystemName];
//    NSString *model = [self deviceModel];
//    NSString *localizedModel = [self deviceLocalizedModel];
    NSString *deviceVersion = [self deviceVersion];
//    MYLog(@"localizedModel %@", localizedModel);
    
    NSArray *keyArr = @[@"devicetype", @"brand", @"telModel", @"os", @"os_version", @"operator", @"network", @"Client_ip", @"token", @"latitude", @"longitude"];
    NSMutableArray *valueArr = [NSMutableArray array];
    [valueArr addObject:@"1"];
    [valueArr addObject:@"APPLE"];
    if (deviceVersion == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:deviceVersion];
    }
    if (systemName == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:systemName];
    }
    if (systemVersion == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:systemVersion];
    }
    if (carrierName == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:carrierName];
    }
    if (networkType == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:networkType];
    }
    if (ipAdress == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:ipAdress];
    }
    if (umengToken == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:umengToken];
    }
    if (longitude == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:longitude];
    }
    if (latitude == nil) {
        [valueArr addObject:VBNULL];
    } else {
        [valueArr addObject:latitude];
    }
    
    NSString *param = @"";
//    MYLog(@"keyArr.count %ld", keyArr.count);
    for (int i = 0; i < keyArr.count; i ++) {
        NSString *str = @"";
//        MYLog(@"key %@", keyArr[i]);
        if ([valueArr[i] isEqualToString:VBNULL]) {
            continue;
        } else {
            str = [NSString stringWithFormat:@"%@=%@&", keyArr[i], valueArr[i]];
        }
//        MYLog(@"str %@", str);
        param = [param stringByAppendingString:str];
    }

    if (userId) {
        param = [param stringByAppendingString:[NSString stringWithFormat:@"userId=%@", userId]];
    } else {
        param = [param substringToIndex:param.length - 1];
    }
    
//    MYLog(@"updataDeviceInfo %@", param);
    [self updateDeviceInfoWithParamString:param];

}


@end
