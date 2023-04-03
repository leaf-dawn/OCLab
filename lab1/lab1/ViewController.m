//
//  ViewController.m
//  lab1
//
//  Created by ByteDance on 2023/3/24.
//

#import "ViewController.h"
#import "View2Controller.h"

@interface ViewController ()
@property(strong, nonatomic) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Hello world
    self.label =  [UILabel new];;
    self.label.text = @"Hello world";
    self.label.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds) - 25, 100, 50);
    // button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"按钮正常" forState: UIControlStateNormal];
    [button setTitle:@"按钮高亮" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds), 100, 50);
    [button addTarget:self action:@selector(func) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.label];
    [self.view addSubview:button];
}

- (void)func{
    // 创建view2
    View2Controller *vc2 = [[View2Controller alloc] init];
    [self presentViewController:vc2 animated:YES completion:nil];
    self.label.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds) + 200, 100, 50);
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)callback {
    NSLog(@"callback");
}

- (void)pop {
    [self.navigationController popViewControllerAnimated:NO];
}



@end
