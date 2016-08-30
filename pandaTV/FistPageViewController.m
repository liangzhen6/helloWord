//
//  FistPageViewController.m
//  pandaTV
//
//  Created by shenzhenshihua on 16/8/9.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "FistPageViewController.h"
#import "FristPageHeadView.h"
@interface FistPageViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *MainScollView;

@end

@implementation FistPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)initView
{
    CGFloat H = Screen_Width * 3/4;
    FristPageHeadView * FPview = [[FristPageHeadView alloc] initWithFrame:CGRectMake(0, -100, Screen_Width, H)];
    
    self.MainScollView.backgroundColor = [UIColor redColor];
    [self.MainScollView addSubview:FPview];



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
