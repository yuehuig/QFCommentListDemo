//
//  QFRootTableViewCell.h
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFDateSourceFactory.h"

@implementation QFDateSourceFactory

+(NSDictionary *)createDateScoucre{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"commentList" ofType:@"json"];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return dic;
}


+(NSArray *)getTypeListArray:(NSArray *)TypeItemsArray{
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    [TypeItemsArray enumerateObjectsUsingBlock:^(NSDictionary* item, NSUInteger idx, BOOL *stop) {
        QFCommentListModel *model = [[QFCommentListModel alloc] initWithDictionary:item];
        [modelArray addObject:model];
    }];
    return modelArray;
}

@end
