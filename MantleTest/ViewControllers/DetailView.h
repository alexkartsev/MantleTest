//
//  DetailView.h
//  MantleTest
//
//  Created by Alexander on 1/4/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailView : UIView

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *zipcode;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSURL *photoUrl;

@end
