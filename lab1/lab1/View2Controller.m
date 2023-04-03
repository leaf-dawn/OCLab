//
//  View2Controller.m
//  lab1
//
//  Created by ByteDance on 2023/3/24.
//

#import "View2Controller.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface View2Controller ()

@end

@implementation View2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [UILabel new];
    label.text = @"Hello world! again";
    label.frame =  CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds), 120, 50);
    [self.view addSubview:label];
    
}


@end
