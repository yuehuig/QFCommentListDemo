//
//  QFRootViewController.m
//  QFCommentListDemo
//
//  Created by Mr.Yao on 15/12/16.
//  Copyright © 2015年 Mr.Yao. All rights reserved.
//

#import "QFRootViewController.h"
#import "QFRootTableViewCell.h"
#import "QFDateSourceFactory.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface QFRootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *dateSource;

@end

@implementation QFRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}

-(void)setUpViews{
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([QFRootTableViewCell class]) bundle:nil] forCellReuseIdentifier:kQFRootTableViewCellIdentifier];
    
    if (!_dateSource) {
        _dateSource =[NSMutableArray new];
    }
    NSDictionary *dic = [QFDateSourceFactory createDateScoucre];
    _dateSource = [NSMutableArray arrayWithArray:[QFDateSourceFactory getTypeListArray:dic[@"data"]]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dateSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QFRootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kQFRootTableViewCellIdentifier];
    [cell createCellViews:_dateSource[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  [tableView fd_heightForCellWithIdentifier:kQFRootTableViewCellIdentifier configuration:^(QFRootTableViewCell* cell) {
        [cell createCellViews:_dateSource[indexPath.row]];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
