//
//  ViewController.m
//  lab3
//
//  Created by ByteDance on 2023/3/29.
//

#import "ViewController.h"
#import <SDWEbImage.h>
#import <Masonry.h>
#import "ListObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ListObject *obj1 = [[ListObject alloc] initWithURLAndMessage:@"https://blog.fansqz.com/img/wallhaven-zygeko.jpg" :@"图片1"];
    ListObject *obj2 = [[ListObject alloc] initWithURLAndMessage:@"https://blog.fansqz.com/img/2205_51708225.jpg" :@"图片2"];
    ListObject *obj3 = [[ListObject alloc] initWithURLAndMessage:@"https://blog.fansqz.com/img/wallhaven-j3m8y5.png" :@"图片3"];
    NSArray *arr = @[obj1, obj2, obj3];
    UIScrollView* content = [UIScrollView new];
    content.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:content];
    UIView *proView;
    for (NSUInteger i = 0; i < arr.count; i++) {
        ListObject *obj = [arr objectAtIndex:i];
        UIView *item = [UIView new];
        [content addSubview:item];
        UIImageView *img = [UIImageView new];
        [img sd_setImageWithURL:[NSURL URLWithString:obj.url]];
        [item addSubview:img];
        UILabel *message = [UILabel new];
        message.text = obj.message;
        message.textColor = [UIColor blackColor];
        [item addSubview:message];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(item);
            make.right.equalTo(message.mas_left);
            make.height.equalTo(content.mas_height).multipliedBy(0.34);
            make.width.equalTo(item).multipliedBy(0.3);
        }];
        [message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(item);
            make.height.equalTo(img);
        }];
        if (i == 0) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.top.equalTo(content);
            }];
        } else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.top.equalTo(proView.mas_bottom);
            }];
        }
        proView = item;
    }
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.center.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(proView.mas_bottom);
        make.height.equalTo(@240);
    }];
}


@end
