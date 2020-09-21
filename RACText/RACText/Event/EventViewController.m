//
//  EventViewController.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clickBtn;

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self.clickBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        ZWWLog(@"点击了按钮");
    }];
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
