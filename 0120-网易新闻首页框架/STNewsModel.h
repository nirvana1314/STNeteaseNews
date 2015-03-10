//
//  STNewsModel.h
//  0122-网易新闻
//
//  Created by 李松涛 on 15-1-22.
//  Copyright (c) 2015年 lst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STNewsModel : NSObject
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *imgextra;
@property (nonatomic, copy) NSString *photosetID;
@property (nonatomic, copy) NSNumber *hasHead;
@property (nonatomic, copy) NSNumber *hasImg;
@property (nonatomic, copy) NSString *lmodify;
@property (nonatomic, copy) NSString *template;
@property (nonatomic, copy) NSString *skipType;
@property (nonatomic, copy) NSNumber *replyCount;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, assign) NSNumber *hasCover;
@property (nonatomic, copy) NSNumber *hasAD;
@property (nonatomic, copy) NSNumber *priority;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) NSNumber *hasIcon;
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *skipID;
@property (nonatomic, copy) NSNumber *order;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *url_3w;
@property (nonatomic, copy) NSString *timeConsuming;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *adTitle;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *TAG;
@property (nonatomic, copy) NSString *TAGS;
@property (nonatomic, copy) NSString *specialID;
@property (nonatomic, copy) NSString *videoID;
@property (nonatomic, strong) NSArray *editor;
@property (nonatomic, strong) NSNumber *imgType;



@end
