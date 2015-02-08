//
//  APIClient.m
//  helpmehelpyou
//
//  Created by Vineet Sathyan on 2/7/15.
//  Copyright (c) 2015 MYH. All rights reserved.
//

#import "APIClient.h"

static NSString * const kGAParseAPIBaseURLString = @"https://help-me-help-you.herokuapp.com/";
//static NSString * const kGAFParseAPIApplicationId = @"";
//static NSString * const kGAFParseRestAPIKey = @"";
//static NSString * const kGAClientKey = @"";

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
    [serializer setValue:@"multipart/form-data " forHTTPHeaderField:@"Content-Type"];
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        [self setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        [self setResponseSerializer:[AFHTTPResponseSerializer serializer]];
        [self setHeadersForRequest:self.requestSerializer];
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    
    return self;
    
}

@end
