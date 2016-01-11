//
//  Photo.m
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 Alex Kartsev. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"title": @"title",
             @"imageURL": @"url"
             };
}

@end
