//
//  Header.h
//  MyInsight
//
//  Created by SongMenglong on 2018/1/26.
//  Copyright © 2018年 SongMenglong. All rights reserved.
//

#ifndef Header_h
#define Header_h


// 字体
//#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:(R)]

#endif /* Header_h */

/*
 Instruments的Leaks检测内存泄漏
 http://blog.csdn.net/kevintang158/article/details/79027274
 
 关于Instruments工具中TimeProfiler和Leaks的归纳总结
 http://blog.csdn.net/huanglinxiao/article/details/79524331
 */

// 蓝牙 服务 特征
#define Data_Service @"FFFF"
#define Data_Character_Write @"FFFE"
#define Data_Character_Read @"FFFD" // Notice

