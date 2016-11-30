//
//  GoddessViewController.m
//  pandaTV
//
//  Created by shenzhenshihua on 16/8/9.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "GoddessViewController.h"
#import "LiveRoomViewController.h"
@interface GoddessViewController ()

@end

@implementation GoddessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LiveRoomViewController *lrVC = [[LiveRoomViewController alloc] init];
    [self.navigationController pushViewController:lrVC animated:YES];

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
