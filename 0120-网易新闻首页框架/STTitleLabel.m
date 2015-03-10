//
//  STTitleLabel.m
//  0120-网易新闻首页框架
//
//  Created by 李松涛 on 15-1-30.
//  Copyright (c) 2015年 lst. All rights reserved.
//

#import "STTitleLabel.h"

@implementation STTitleLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textColor = [UIColor blackColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = YES;
        self.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

-(void)changeWithPercent:(CGFloat)percent
{
    int curI = (1 - percent) * 100 / 5;
    for (int i = 0; i < 20; i++) {
        if (curI % 2 == 0) {
            return;
        }
    }
        self.font = [UIFont systemFontOfSize:(15.0 + percent * 5.0)];
        self.textColor = [UIColor colorWithRed:1.0 * percent green:0.0 blue:0.0 alpha:1.0];
}

@end
