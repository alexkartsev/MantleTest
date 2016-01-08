//
//  DetailViewForPhoto.m
//  MantleTest
//
//  Created by Alexander on 1/8/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

#import "DetailViewForPhoto.h"
#import <SDWebImage/UIImageView+WebCache.h>
//#import "UIImageView+AFNetworking.h"

@interface DetailViewForPhoto()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *photoImageView;

@end

@implementation DetailViewForPhoto

-(id)initWithFrame:(CGRect)aRect {
    self = [super initWithFrame:aRect];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines = 0;
        [self addSubview:self.titleLabel];
        
        self.photoImageView = [[UIImageView alloc] init];
        [self addSubview:self.photoImageView];
    }
    return self;
}

-(void)layoutSubviews {
    if (self.title && self.titleLabel) {
        self.titleLabel.text = self.title;
        self.titleLabel.frame = CGRectMake(self.bounds.size.width/2-150, 150, 300, [self.titleLabel sizeThatFits:CGSizeMake(300, 100)].height);
        
        if (self.photoUrl && self.photoImageView) {
            self.photoImageView.frame = CGRectMake(self.bounds.size.width/2-150, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height+20, 300, 300);
            //[self.photoImageView setImageWithURL:self.photoUrl placeholderImage:nil];
            [self.photoImageView sd_setImageWithURL:self.photoUrl];
            self.contentSize = CGSizeMake(self.bounds.size.width, self.photoImageView.frame.origin.y+self.photoImageView.frame.size.height+20);
        }
    }
}

@end
