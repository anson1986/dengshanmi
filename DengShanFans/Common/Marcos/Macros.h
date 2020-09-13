//
//  Macros.h
//  SAJControl
//
//  Created by user on 2017/8/1.
//  Copyright © 2017年 SAJDev. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define WindowWidth      [UIScreen mainScreen].bounds.size.width

#define WindowHeight     [UIScreen mainScreen].bounds.size.height

#define RGB(R, G, B)     [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

#define MainColor RGB(107,171,210)

#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define BottomBarHeight   (49.f)

//安全区域
#define kBottomSafeAreaH ((WindowHeight>=812) ||(WindowWidth >= 812) ? 34.0f : 0.0f)

#define kTopH ((WindowHeight>=812) ||(WindowWidth>=812) ? 88.0f :64.0f)

//十六进制颜色
#define RGBValue(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


// 定义通用颜色
#define kBlackColor         [UIColor blackColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]

#define LoginSucceed @"loginSuccess"

#define LogoutSucceed @"logoutSuccess"

#define LoginData  @"LoginData"

#define AuthorSumitSucceed @"authorSumitSucceed"

#define AddBankCardSucceed @"addBankCardSucceed"

#define RefreshComment @"refreshComment"

#define PasswordType @"passwordType"

#define VideoPlayer [VideoMgr shareInstance]


#define LaunchOptionsRemoteNotifi @"launchOptionsRemoteNotifi"

#define YSloginType @"ysloginType"

#define RefreshAttentionList @"RefreshAttentionList"

/// 取
#define AGUserDefaultsGET(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
/// 写
#define AGUserDefaultsSET(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]
/// 立即储存
#define AGUserDefaultsSynchronize [[NSUserDefaults standardUserDefaults] synchronize]
/// 删
#define AGUserDefaultsRemove(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]

#define BackToHomePage @"backtohomepage"

//tW切图w   VW限定的w 返回对应的h
#define MCAdaptiveH(TW,TH,VW) (((VW) *(TH)) / (TW))

#define MCAdaptiveW(TW,TH,VH) (((TW) *  (VH)) / (TH))


//仅用于字体
#define MC10  MCWidthScale*10
#define MC11  MCWidthScale*11
#define MC12  MCWidthScale*12
#define MC13  MCWidthScale*13
#define MC14  MCWidthScale*14
#define MC15  MCWidthScale*15
#define MC16  MCWidthScale*16
#define MC17  MCWidthScale*17
#define MC18  MCWidthScale*18
#define MC19  MCWidthScale*19

/** 时间间隔 */
#define kHUDDuration            (1.f)

/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))



#endif /* Macros_h */
