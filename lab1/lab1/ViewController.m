//
//  ViewController.m
//  lab1
//
//  Created by ByteDance on 2023/3/24.
//

#import "ViewController.h"
#import "View2Controller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Hello world
    UILabel *label = [UILabel new];
    label.text = @"Hello world";
    label.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds) - 25, 100, 50);
    // button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"按钮正常" forState: UIControlStateNormal];
    [button setTitle:@"按钮高亮" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds), 100, 50);
    [button addTarget:self action:@selector(func) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:label];
    [self.view addSubview:button];
}

- (void)func{
    // 创建view2
    View2Controller *vc2 = [[View2Controller alloc] init];
    NSLog(@"跳转页面");
    [self.navigationController presentModalViewController:vc2 animated:YES];
}

- (void)callback {
    NSLog(@"callback");
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:NO];
}



@end
