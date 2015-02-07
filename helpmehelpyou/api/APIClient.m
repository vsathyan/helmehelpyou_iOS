//
//  APIClient.m
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "APIClient.h"

static NSString * const kGAParseAPIBaseURLString = @"";
static NSString * const kGAFParseAPIApplicationId = @"";
static NSString * const kGAFParseRestAPIKey = @"";
static NSString * const kGAClientKey =
@"";

NSString * const kGASessionToken = @"HMHYSessionToken";
NSString * const kGAUserObject = @"HMHYUserObject";

@implementation APIClient

+ (APIClient *)sharedClient {
    static APIClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:kGAParseAPIBaseURLString]];
    });
    
    return sharedClient;
}

- (void)setHeadersForRequest:(AFHTTPRequestSerializer *)serializer
{
    [serializer setValue:kGAFParseAPIApplicationId forHTTPHeaderField:@"X-Parse-Application-Id"];
    [serializer setValue:kGAFParseRestAPIKey forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [serializer setValue:kGAClientKey forHTTPHeaderField:@"X-Parse-Client-Key"];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kGASessionToken])
    {
        [serializer setValue:[[NSUserDefaults standardUserDefaults] objectForKey:kGASessionToken] forHTTPHeaderField:@"X-Parse-Session-Token"];
    }
    
    [serializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [serializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"enctype"];
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [self setHeadersForRequest:self.requestSerializer];
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    
    return self;
    
}

@end
