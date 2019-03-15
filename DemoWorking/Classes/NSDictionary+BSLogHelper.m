//
//  NSDictionary+BSLogHelper.m
//  BatteryStation
//
//  Created by immotor on 2019/3/9.
//  Copyright © 2019 Joe. All rights reserved.
//

#import "NSDictionary+BSLogHelper.h"

@implementation NSDictionary (BSLogHelper)

#ifdef DEBUG
// NSLog字典对象时会调用此方法，将里面的中文在控制台打印出来
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
  
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSString *logString;
        @try {
            logString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
        } @catch (NSException *exception) {
            logString = [NSString stringWithFormat:@"打印字典时转换失败：%@",exception.reason];
        } @finally {
            return logString;
        }
    }
    
    NSMutableString *string = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [string appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [string appendString:@"}\n"];
    return string;
}
#endif


@end
