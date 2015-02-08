//
//  APIClient.h
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import <AFNetworking/AFNetworking.h>

extern NSString * const kGASessionToken;
extern NSString * const kGAUserObject;

@interface APIClient : NSObject

+ (NSMutableDictionary *)getGoals;
+ (void)addGoal:(NSDictionary *)goal;
+ (void)updateGoal:(NSDictionary *)goal;

@end
