//
//  DetailViewForPhoto.m
//  MantleTest
//
//  Created by Alexander on 1/8/16.
//  Copyright © 2016 Alex Kartsev. All rights reserved.
//

#import "DetailViewForPhoto.h"
#import <SDWebImage/UIImageView+WebCache.h>
//#import "UIImageView+AFNetworking.h"

@interface DetailViewForPhoto()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *photoImageView;

@end

@implementation DetailViewForPhoto

static CGFloat MAXWIDTH = 300.0f;
static CGFloat MAXHEIGHT = 300.0f;

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
        self.titleLabel.frame = CGRectMake(self.bounds.size.width/2-MAXWIDTH/2, 150, MAXWIDTH, [self.titleLabel sizeThatFits:CGSizeMake(MAXWIDTH, 100)].height);
        
        if (self.photoUrl && self.photoImageView) {
            self.photoImageView.frame = CGRectMake(self.bounds.size.width/2-MAXWIDTH/2, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height+20, MAXWIDTH, MAXHEIGHT);
            //[self.photoImageView setImageWithURL:self.photoUrl placeholderImage:nil];
            [self.photoImageView sd_setImageWithURL:self.photoUrl];
            self.contentSize = CGSizeMake(self.bounds.size.width, self.photoImageView.frame.origin.y+self.photoImageView.frame.size.height+20);
        }
    }
}

@end
