//
//  SubjectSecondVC.m
//  RACText
//
//  Created by step_zhang on 2020/9/16.
//  Copyright © 2020 step_zhang. All rights reserved.
//

#import "SubjectSecondVC.h"

@interface SubjectSecondVC ()

@end

@implementation SubjectSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.delagetaSubject) {
        [self.delagetaSubject sendNext:@"其实,这里可以是字典"];
            //若想要持续代理必须注释掉这一步
    //        [self.delagetaSubject sendCompleted];
        }
}

@end
