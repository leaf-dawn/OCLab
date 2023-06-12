//
//  ViewController.m
//  lab4
//
//  Created by ByteDance on 2023/3/30.
//

#import "ViewController.h"
#import "ListObject.h"
#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/SDWebImage.h>

#define ITEM_HEIGHT 80
#define MAX_COUNT 5

@interface ViewController () <UIScrollViewDelegate>


@property(strong, nonatomic) NSMutableArray *imgArray;
@property(strong, nonatomic) UIScrollView *loopScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
}

// 懒加载初始化数组
- (NSMutableArray *)imgArray {
    if (_imgArray == nil) {
        _imgArray = [[NSMutableArray alloc] initWithCapacity:5];
        //添加三个列表
        ListObject *obj1 = [[ListObject alloc] initWithURLAndMessage:@"https://blog.fansqz.com/img/wallhaven-zygeko.jpg" :@"图片1"];
        ListObject *obj2 = [[ListObject alloc] initWithURLAndMessage:@"https://blog.fansqz.com/img/2205_51708225.jpg" :@"图片2"];
        ListObject *obj3 = [[ListObject alloc] initWithURLAndMessage:@"https://blog.fansqz.com/img/wallhaven-j3m8y5.png" :@"图片3"];
        [_imgArray addObject:obj3];
        [_imgArray addObject:obj1];
        [_imgArray addObject:obj2];
        [_imgArray addObject:obj3];
        [_imgArray addObject:obj1];
    }
    return _imgArray;
}

- (void) setupScrollView {
    UIScrollView *sc = [UIScrollView new];
    sc.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:sc];
    UIView *proItem;
    NSMutableArray *arr = [self imgArray];
    for (int i = 0; i < MAX_COUNT; i++) {
        ListObject *obj = [self.imgArray objectAtIndex:i];
        UIView* item = [UIView new];
        [sc addSubview:item];
        UIImageView* img = [UIImageView new];
        [img sd_setImageWithURL:[NSURL URLWithString:obj.url]];
        img.backgroundColor = [UIColor orangeColor];
        [item addSubview:img];
        UILabel* message = [UILabel new];
        message.text = obj.message;
        [item addSubview:message];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(item);
            make.right.equalTo(message.mas_left);
            make.width.equalTo(item).multipliedBy(0.3);
        }];
        [message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(item);
            make.left.equalTo(img.mas_right);
        }];
        if (i == 0) {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(ITEM_HEIGHT);
                make.top.equalTo(sc.mas_top);
            }];
        } else {
            [item mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(ITEM_HEIGHT);
                make.top.equalTo(proItem.mas_bottom);
            }];
        }
        proItem = item;
    }
    //刚开始应该滚动到第二张显示，因为第一张其实是最后一张图片
    [sc setContentOffset:CGPointMake(ITEM_HEIGHT, 0) animated:NO];
    // 设置scrollView的布局
    [sc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(ITEM_HEIGHT * 2);
        make.bottom.equalTo(proItem.mas_bottom);
    }];
    // 设置代理的对象
    sc.delegate = self;
    self.loopScrollView = sc;
    
}

// UIScrollView的代理方法，在该方法中改变UIPageControl并处理边缘滚动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {    // 获取UIScrollView位置
    CGPoint offset = [scrollView contentOffset];
    // 计算滚动到第几页了
    int currentPage = offset.y / ITEM_HEIGHT;
    NSLog(@"%d", currentPage);
    // 设置UIPageControl
    // 对第一行和最后一行做特殊处理
    if (currentPage == 0) {
        NSLog(@"到第一页了");
        [self.loopScrollView setContentOffset:CGPointMake(0, ITEM_HEIGHT * (MAX_COUNT - 2)) animated:NO];
    } else if (currentPage == MAX_COUNT - 2) {
        NSLog(@"到最后一页了");
        [self.loopScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}

@end
