//
//  MainViewController.m
//  pandaTV
//
//  Created by shenzhenshihua on 16/8/9.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "MainViewController.h"
#import "LiveRoomViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LiveRoomViewController *lrVC = [[LiveRoomViewController alloc] init];
    lrVC.urlStr = PushSever;
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:lrVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;


}
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
