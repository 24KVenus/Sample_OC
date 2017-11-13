//
//  MacroDefines_UserDefaultsKey.h
//  Sample
//
//  Created by Yijie Guo on 1/7/16.
//  Copyright © 2016 self. All rights reserved.
//

#ifndef MacroDefines_UserDefaultsKey_h
#define MacroDefines_UserDefaultsKey_h


#undef kUD_ObjectForKey
#define kUD_ObjectForKey(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#undef kUD_SetObjectForKey
#define kUD_SetObjectForKey(object, key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]

#undef kUD_RemoveObjectForKey
#define kUD_RemoveObjectForKey(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];





//网络状态
#undef kUDK_NetworkState
#define kUDK_NetworkState @"NetworkState"


#endif /* MacroDefines_UserDefaultsKey_h */
