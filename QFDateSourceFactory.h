//
//  QFRootTableViewCell.h
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFCommentListModel.h"

@interface QFDateSourceFactory : NSObject

+ (NSDictionary *)createDateScoucre;

+ (NSArray *)getTypeListArray:(NSArray *)TypeItemsArray;

@end
