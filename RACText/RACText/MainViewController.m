//
//  MainViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/14.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "MainViewController.h"

#import "TargetOfUISignalVC.h"
#import "TimeViewController.h"
#import "NSNotificationViewController.h"
#import "EventViewController.h"
#import "DelegateViewController.h"
#import "KVOViewController.h"



@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *groupDataList;
@property (nonatomic, strong) UIImageView *conversationBg;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.conversationBg];
    [self.view addSubview:self.tableView];
    self.conversationBg.image = [UIImage imageNamed:@"1"];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView reloadData];
}
#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupDataList.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 67;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = self.groupDataList[indexPath.row];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:23];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
        case 7:
        {
            
        }
            break;
            
        default:
            break;
    }
}
-(NSMutableArray *)groupDataList{
    if (!_groupDataList) {
        _groupDataList = [NSMutableArray new];
        [_groupDataList addObject:@"RACCommand"];
        [_groupDataList addObject:@"RACSignal"];
        [_groupDataList addObject:@"RACSubject"];
        [_groupDataList addObject:@"RAC代替代理"];
        [_groupDataList addObject:@"RAC代替KVO"];
        [_groupDataList addObject:@"监听事件"];
        [_groupDataList addObject:@"代替通知"];
        [_groupDataList addObject:@"代替定时器"];
        [_groupDataList addObject:@"代替UI控件的addtarget"];
        //[_groupDataList addObject:@"监听事件"];
    }
    return _groupDataList;
}
- (UITableView *)tableView{
    if (!_tableView) {
        CGFloat h = KScreenHeight;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, h)
                                                  style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        
    }
    return _tableView;
}
-(UIImageView *)conversationBg
{
    if (!_conversationBg) {
        _conversationBg = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _conversationBg.backgroundColor = [UIColor clearColor];
        //图片不变形处理
        [self imgNoTransformation:_conversationBg];
    }
    return _conversationBg;
}
-(void)imgNoTransformation:(UIImageView *)img{
    img.contentMode = UIViewContentModeScaleAspectFill;
    img.clipsToBounds = YES; //是否剪切掉超出 UIImageView 范围的图片
    img.contentScaleFactor = [UIScreen mainScreen].scale;
}
@end
