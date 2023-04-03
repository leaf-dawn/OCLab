//
//  ListObject.m
//  lab3
//
//  Created by ByteDance on 2023/3/30.
//

#import <Foundation/Foundation.h>
#import "ListObject.h"
@interface ListObject ()

@end

@implementation ListObject

- (instancetype) initWithURLAndMessage:(NSString *)url :(NSString *)message {
   self = [super init];
   if (self) {
       _message = message;
       _url = url;
   }
   return self;
}
@end
