//
//  GoddessViewController.m
//  pandaTV
//
//  Created by shenzhenshihua on 16/8/9.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "GoddessViewController.h"
#import "LiveRoomViewController.h"
#import "DownLoadData.h"
#import "ListModel.h"
#import "ListTableViewCell.h"
@interface GoddessViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataSource;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation GoddessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    [self initTableView];
    // Do any additional setup after loading the view.
}


- (void)requestData{

    [DownLoadData requestWithUrlString:@"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1" parameters:nil type:HttpRequestTypeGet success:^(id success) {
        NSLog(@"%@-----%@",success,success[@"lives"]);
        if ([success[@"dm_error"] intValue]==0) {
            //成功
            NSArray * arr = success[@"lives"];
        NSLog(@"%@",arr);
            for (NSDictionary * dict in arr) {
                ListModel * model = [ListModel listModelWithDict:dict];
                [self.dataSource addObject:model];
            }
            
        }
        [self.tableView reloadData];
//        if ([[NSThread currentThread] isMainThread]) {
//            [self.tableView reloadData];
//        }else{
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//        });
    } failue:^(NSError *failue) {
        NSLog(@"%@",failue);
    }];


}




- (void)initTableView{
  
    [self.view addSubview:self.tableView];

}


#pragma mark  tableViewdelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Screen_Width+70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell * cell = [ListTableViewCell listTableViewCellWithTableView:tableView];
    if (self.dataSource[indexPath.row]) {
         cell.model = self.dataSource[indexPath.row];
    }
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListModel * model = self.dataSource[indexPath.row];
    LiveRoomViewController *lrVC = [[LiveRoomViewController alloc] init];
    lrVC.urlStr = model.stream_addr;
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:lrVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (UITableView *)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height) style:UITableViewStylePlain];
        _tableView.dataSource =self;
        _tableView.delegate = self;
    }

    return _tableView;

}







//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    LiveRoomViewController *lrVC = [[LiveRoomViewController alloc] init];
//    [self.navigationController pushViewController:lrVC animated:YES];
///*http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1 接口*/
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
