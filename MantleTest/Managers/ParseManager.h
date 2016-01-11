//
//  ParseManager.h
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 Alex Kartsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"

@interface ParseManager : NSObject

+ (instancetype) sharedManager;

- (void)getListOfUsersWithCompletitionBlock: (void (^)(NSArray *array, NSError *error))completitionBlock;
- (void)getPhotosWithCompletitionBlock: (void (^)(NSArray *array, NSError *error))completitionBlock;

@end
