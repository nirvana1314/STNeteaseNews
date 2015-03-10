//
//  STNetWorkTools.h
//  0122-网易新闻
//
//  Created by 李松涛 on 15-1-22.
//  Copyright (c) 2015年 lst. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface STNetWorkTools : AFHTTPSessionManager
+ (instancetype)sharedSTNetWorkTools;
@end
