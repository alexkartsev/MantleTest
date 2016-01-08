//
//  Address.m
//  MantleTest
//
//  Created by Alexander on 1/8/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

#import "Address.h"

@implementation Address

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"city": @"city",
             @"street": @"street",
             @"zipcode": @"zipcode"
             };
}

@end
