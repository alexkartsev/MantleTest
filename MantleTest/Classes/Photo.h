//
//  Photo.h
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//

#import <Mantle.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *imageURL;

@end
