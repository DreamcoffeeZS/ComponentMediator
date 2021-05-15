//
//  ZSViewController.m
//  ComponentMediator
//
//  Created by Fengzi on 05/15/2021.
//  Copyright (c) 2021 Fengzi. All rights reserved.
//

#import "ZSViewController.h"

#import "CTMediator+ComponentA.h"
#import "CTMediator+ComponentB.h"
#import "RoutePublicHeader.h"
#import "RouteProtocolManager.h"

@interface ZSViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation ZSViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试组件化";
    self.dataArray = @[@"CTMediator：进入组件A界面",
                       @"CTMediator：进入组件B界面",
                       @"URL-Block：调用组件A的打印服务",
                       @"URL-Block：进入组件A界面",
                       @"URL-Block：进入组件B界面",
                       @"URL-Protocol：进入组件A界面",
                       @"URL-Protocol：进入组件B界面",
                     ];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}


#pragma mark - Delegate：UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self handleEventIndexPath:indexPath];
}


#pragma mark - private Methods

- (void)handleEventIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
           UIViewController *vc = [[CTMediator sharedInstance] mediator_fetchComponentAVC:@{@"vcTitle":@"Mediator_组件A"}];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:{
            UIViewController *vc = [[CTMediator sharedInstance] mediator_fetchComponentBVC:@{@"vcTitle":@"Mediator_组件B"}];
             [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:{
            NSDictionary *userInfo = @{@"msg":@"Today‘s weather is very good!"};
            [MGJRouter openURL:ZSComponetAPrintInfo withUserInfo:userInfo completion:nil];
            break;
        }
        case 3:{
            UIViewController *vc = [MGJRouter objectForURL:ZSComponetAVC
                                              withUserInfo:@{@"vcTitle": @"组件A-VC"}];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:{
            UIViewController *vc = [MGJRouter objectForURL:ZSComponetBVC
                                              withUserInfo:@{@"vcTitle": @"组件B-VC"}];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5: {
            Class<ComponentAProtocol> class = [RouteProtocolManager classForProtocol:@protocol(ComponentAProtocol)];
            UIViewController *vc = [class fetchComponentAVCWithTitle:@"ComponentA-VC"];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        case 6: {
            Class<ComponentBProtocol> class = [RouteProtocolManager classForProtocol:@protocol(ComponentBProtocol)];
            UIViewController *vc = [class fetchComponentBVCWithTitle:@"ComponentB-VC"];
            [self.navigationController pushViewController:vc animated:true];
            break;
        }
        default:
            break;
    }
}

#pragma mark - Getter && Setter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain
                      ];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 60;
    }
    return _tableView;
}

@end
