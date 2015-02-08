//
//  APIClient+login.m
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "APIClient+login.h"

@implementation APIClient (login)

+ (NSURLSessionDataTask *)createUser:(NSDictionary *)user block:(void (^)(id sessionObject, NSError *error))block
{
    //[self setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    return [[APIClient sharedClient] POST:@"users" parameters:user success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"%@ = postsFromResponse", JSON);
        if (block) {
            block(JSON, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            NSLog(@"error = %ld, error code = %@", (long)[error code], [error localizedDescription]);
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)getUser:(NSString *)userId block:(void (^)(id sessionObject, NSError *error))block
{
    NSString *returnParams = [NSString stringWithFormat:@"%@/%@", @"users", userId];
    return [[APIClient sharedClient] GET:returnParams parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"%@ = postsFromResponse", JSON);
        if (block) {
            block(JSON, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            NSLog(@"error = %ld, error code = %@", (long)[error code], [error localizedDescription]);
            block(nil, error);
        }
    }];
}

@end
