//
//  QFRootViewController.m
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFRootViewController.h"
#import "QFRootTableViewCell.h"

@interface QFRootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dateSource;

@end

@implementation QFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setUpViews{
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QFRootTableViewCell class]) bundle:nil] forCellReuseIdentifier:kQFRootTableViewCellIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dateSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QFRootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kQFRootTableViewCellIdentifier];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
