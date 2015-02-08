//
//  APIClient.m
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "APIClient.h"

static NSString * const kGAParseAPIBaseURLString = @"https://help-me-help-you.herokuapp.com/";

NSString * const kGASessionToken = @"HMHYSessionToken";
NSString * const kGAUserObject = @"HMHYUserObject";

@implementation APIClient

+ (NSMutableDictionary *)getGoals{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *goals = [[NSMutableDictionary alloc] init];
    [manager GET:@"https://help-me-help-you.herokuapp.com/goals.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [goals setObject:responseObject[0][@"statement"] forKey:@"statement"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    return goals;
}

+ (void)addGoal:(NSDictionary *)goal{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"https://help-me-help-you.herokuapp.com/goals.json" parameters:goal success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

+ (void)updateGoal:(NSDictionary *)goal{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager PUT:@"https://help-me-help-you.herokuapp.com/goals/1.json" parameters:goal success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}



@end
