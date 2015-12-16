//
//  QFCommentListModel.m
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFCommentListModel.h"

@implementation QFCommentListModel

-(QFCommentListModel *)initWithDictionary:(NSDictionary *)dictionary{
    self =[super init];
    if (self) {
        self.avatar = dictionary[@"avatar"];
        self.content = dictionary[@"content"];
        self.nickname = dictionary[@"nickname"];
        self.comlist = dictionary[@"comlist"];
    }
    return self;
}

@end


@implementation CommentListItem

-(CommentListItem *)initWithDictionary:(NSDictionary *)dictionary{
    self =[super init];
    if (self) {
        self.avatar = dictionary[@"avatar"];
        self.content = dictionary[@"content"];
        self.nickname = dictionary[@"nickname"];
    }
    return self;
}

@end