//
//  ListObject.h
//  lab3
//
//  Created by ByteDance on 2023/3/30.
//


@interface ListObject : NSObject

@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *message;

- (instancetype) initWithURLAndMessage:(NSString*)url :(NSString*)message;
@end
