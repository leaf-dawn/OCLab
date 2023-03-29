//
//  ViewController.m
//  lab1
//
//  Created by ByteDance on 2023/3/24.
//

#import "ViewController.h"
#import "View2Controller.h"
#import "Masonry.h"

@interface ViewController ()
@property(nonatomic) UIView *blueView;
@property(nonatomic) UIView *redView;
@property(nonatomic) UIView *greenView;
@property(nonatomic) Boolean flag;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Hello world
    self.redView = [UIView new];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    self.greenView = [UIView new];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    self.blueView = [UIView new];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [button setTitle:@"按钮" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(func) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
    }];
    [self func];
    
}

- (void) func {
    if (!self.flag) {
        [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.width.equalTo(self.view).multipliedBy(0.5);
                make.height.equalTo(self.redView.mas_width);
        }];
        
        [self.greenView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.size.equalTo(self.redView).multipliedBy(0.75);
        }];
        
        [self.blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(self.view);
                make.size.equalTo(self.greenView).multipliedBy(0.75);
        }];
        [self.view layoutIfNeeded];
        self.blueView.clipsToBounds = YES;
        self.blueView.layer.cornerRadius = self.blueView.frame.size.width / 2;
        self.flag = true;
    } else {
        UIEdgeInsets padding = UIEdgeInsetsMake(20, 10, 20, 10);
        [self.redView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.equalTo(self.view).insets(padding);
                make.bottom.equalTo(self.greenView.mas_top).offset(-10);
                make.height.equalTo(@[self.blueView, self.greenView]);
        }];
        [self.greenView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view).insets(padding);
                make.bottom.equalTo(self.blueView.mas_top).offset(-10);
        }];
        [self.blueView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(self.view).insets(padding);
        }];
        [self.view layoutIfNeeded];
        self.blueView.clipsToBounds = YES;
        self.blueView.layer.cornerRadius = 0;
        self.flag = false;
    }
}

@end
