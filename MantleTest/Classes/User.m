//
//  User.m
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 Alex Kartsev. All rights reserved.
//

#import "User.h"

@implementation User

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"address": @"address",
             @"email": @"email"
             };
}

@end
