//
//  QFRootTableViewCell.m
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFRootTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <HexColors/HexColors.h>

@implementation QFRootTableViewCell

- (void)awakeFromNib {
    UIImage *image = [UIImage imageNamed:@"commentBackground.png"];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
    self.backgroundImageView.image = image;
}

-(void)createCellViews:(QFCommentListModel *)item{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:item.avatar]];
    self.nameLabel.text = item.nickname;
    self.commentLabel.text = item.content;
    [self createCommentListViewWithItems:item.comlist];
}

- (void)createCommentListViewWithItems:(NSArray *)itemArray{
    for (UIView *v in self.commentListView.subviews){
        [v removeFromSuperview];
    }
    if (itemArray.count) {
        self.backgroundImageView.hidden = NO;
    }else{
        self.backgroundImageView.hidden = YES;
    }
    
    if (itemArray.count) {
        UIView *previousItemView = nil;
        UIView *lastItemView = nil;
        for (NSDictionary *commentDictionary in itemArray){
            CommentListItem *commentItem = [[CommentListItem alloc ]initWithDictionary:commentDictionary];
            UILabel *giftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.commentListView.frame), 20)];
            giftLabel.font = [UIFont systemFontOfSize:13];
            giftLabel.textColor = [HXColor hx_colorWithHexString:@"606060"];
            
            NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ ：%@",commentItem.nickname,commentItem.content]];
            
            NSRange ranggeNickName = [[text string]rangeOfString:commentItem.nickname];
            [text addAttribute:NSForegroundColorAttributeName value:[HXColor hx_colorWithHexString:@"919191"] range:ranggeNickName];
            giftLabel.attributedText =text;
            giftLabel.numberOfLines = 0;
            giftLabel.translatesAutoresizingMaskIntoConstraints = NO;
            giftLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 72;
            [self.commentListView addSubview:giftLabel];
            
            [self.commentListView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[giftLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(giftLabel)]];
            
            if (previousItemView){
                [self.commentListView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[previousItemView]-[giftLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(previousItemView,giftLabel)]];
            }else{
                [self.commentListView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[giftLabel]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(giftLabel)]];
            }
            
            previousItemView = giftLabel;
            lastItemView = giftLabel;
        }
        
        if (lastItemView){
            [self.commentListView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lastItemView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lastItemView)]];
        }
    }
    
    [self.commentListView updateConstraintsIfNeeded];
    [self.commentListView layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
