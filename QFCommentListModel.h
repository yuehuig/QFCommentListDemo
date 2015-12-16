//
//  QFCommentListModel.h
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFCommentListModel : NSObject

@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, copy)NSString *nickname;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, strong)NSArray *comlist;

- (QFCommentListModel *)initWithDictionary: (NSDictionary *)dictionary;

@end

@interface CommentListItem : NSObject

@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, copy)NSString *nickname;
@property (nonatomic, copy)NSString *content;

- (CommentListItem *)initWithDictionary: (NSDictionary *)dictionary;

@end