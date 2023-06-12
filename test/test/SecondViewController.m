//
//  SecondViewController.m
//  test
//
//  Created by ByteDance on 2023/3/31.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Create a label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds) - 25, 100, 50)];
    label.text = @"Second View";
    [self.view addSubview:label];
}

@end
