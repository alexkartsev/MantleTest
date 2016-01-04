//
//  DetailViewController.h
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "User.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Photo *photo;

@end
