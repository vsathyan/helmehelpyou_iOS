//
//  APIClient+login.h
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "APIClient.h"

@interface APIClient (login)
+ (NSURLSessionDataTask *)createUser:(NSDictionary *)user block:(void (^)(id sessionObject, NSError *error))block;

+ (NSURLSessionDataTask *)getUser:(NSString *)userId block:(void (^)(id sessionObject, NSError *error))block;
@end
