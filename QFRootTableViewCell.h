//
//  QFRootTableViewCell.h
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QFCommentListModel.h"

static NSString *const kQFRootTableViewCellIdentifier = @"QFRootTableViewCell";

@interface QFRootTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIButton *attentionButton;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *commentListView;

- (void)createCellViews:(QFCommentListModel *)item;

@end
