//
//  ParseManager.m
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 Alex Kartsev. All rights reserved.
//

#import "ParseManager.h"
#import "Photo.h"
#import "User.h"
#import <Mantle.h>

@interface ParseManager ()

@property (strong, nonatomic) AFHTTPSessionManager* sessionManager;

@end

@implementation ParseManager

static NSString *requestURL = @"http://jsonplaceholder.typicode.com/";

+ (instancetype)sharedManager {
    
    static ParseManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ParseManager alloc] init];
    });
    
    return manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.sessionManager = [AFHTTPSessionManager manager];
    }
    return self;
}

- (void)getListOfUsersWithCompletitionBlock: (void (^)(NSArray *array, NSError *error))completitionBlock {
    [self.sessionManager GET:[NSString stringWithFormat:@"%@users",requestURL]
                  parameters:nil
                    progress:nil
                     success:^(NSURLSessionTask *task, id responseObject) {
                         NSArray *list = [MTLJSONAdapter modelsOfClass:User.class fromJSONArray:responseObject error:nil];
                         completitionBlock (list, nil);
                     }
                     failure:^(NSURLSessionTask *operation, NSError *error) {
                         completitionBlock (nil, error);
                         NSLog(@"Error: %@", error);
                     }];
}

- (void)getPhotosWithCompletitionBlock: (void (^)(NSArray *array, NSError *error))completitionBlock {
    [self.sessionManager GET:[NSString stringWithFormat:@"%@photos",requestURL]
                  parameters:nil
                    progress:nil
                     success:^(NSURLSessionTask *task, id responseObject) {
                         NSArray *list = [MTLJSONAdapter modelsOfClass:Photo.class fromJSONArray:responseObject error:nil];
                         completitionBlock (list, nil);
                     }
                     failure:^(NSURLSessionTask *operation, NSError *error) {
                         completitionBlock (nil, error);
                         NSLog(@"Error: %@", error);
                     }];
}

@end
