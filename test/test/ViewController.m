#import "ViewController.h"
#import "SecondViewController.h"
#import ""
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    NSURL *fileURL = [NSURL URLWithString:@"/Users/bytedance/Desktop/2023-4-3 11.35拍摄的影片.mov"];
    AV
}

- (void)goToSecondView {
    // Create an instance of the second view controller
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    // Push the second view controller onto the navigation stack
    [self.navigationController pushViewController:secondVC animated:YES];
}

@end
