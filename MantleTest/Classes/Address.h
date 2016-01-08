//
//  Address.h
//  MantleTest
//
//  Created by Alexander on 1/8/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Address : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *zipcode;
@property (strong, nonatomic) NSString *city;

@end
