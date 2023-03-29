//
//  View2Controller.m
//  lab1
//
//  Created by ByteDance on 2023/3/24.
//

#import "View2Controller.h"

@interface View2Controller ()

@end

@implementation View2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [UILabel new];
    label.text = @"Hello world...";
    label.frame =  CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds), 100, 50);
    [self.view addSubview:label];
    NSLog(@"加载");
    
}


@end
