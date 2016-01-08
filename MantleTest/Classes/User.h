//
//  User.h
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//

#import <Mantle.h>
#import <Foundation/Foundation.h>
#import "Address.h"

@interface User : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) Address *address;

@end
