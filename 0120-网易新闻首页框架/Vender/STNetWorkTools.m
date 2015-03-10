//
//  STNetWorkTools.m
//  0122-网易新闻
//
//  Created by 李松涛 on 15-1-22.
//  Copyright (c) 2015年 lst. All rights reserved.
//

#import "STNetWorkTools.h"

@implementation STNetWorkTools
+ (instancetype)sharedSTNetWorkTools
{
    static STNetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        instance = [[STNetWorkTools alloc] initWithSessionConfiguration:config];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        instance.requestSerializer = [AFHTTPRequestSerializer serializer];
    });
    return instance;
}
@end
