//
//  DetailView.m
//  MantleTest
//
//  Created by Alexander on 1/4/16.
//  Copyright © 2016 iTechArt. All rights reserved.
//

#import "DetailView.h"
#import "UIImageView+AFNetworking.h"

@interface DetailView()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UILabel *cityLabel;
@property (strong, nonatomic) UILabel *streetLabel;
@property (strong, nonatomic) UILabel *zipcodeLabel;
@property (strong, nonatomic) UIImageView *photoImageView;

@end

@implementation DetailView

-(id)initWithFrame:(CGRect)aRect {
    self = [super initWithFrame:aRect];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)layoutSubviews {
    if (self.title && !self.titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.text = self.title;
        self.titleLabel.frame = CGRectMake(self.bounds.size.width/2-150, 150, 300, [self.titleLabel sizeThatFits:CGSizeMake(300, 100)].height);
        [self addSubview:self.titleLabel];
        if (self.email && !self.emailLabel) {
            self.emailLabel = [[UILabel alloc] init];
            self.emailLabel.numberOfLines = 0;
            self.emailLabel.textAlignment = NSTextAlignmentCenter;
            self.emailLabel.text = self.email;
            self.emailLabel.frame = CGRectMake(self.bounds.size.width/2-150, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height+20, 300, [self.emailLabel sizeThatFits:CGSizeMake(300, 100)].height);
            [self addSubview:self.emailLabel];
        }
        if (self.city && !self.cityLabel) {
            self.cityLabel = [[UILabel alloc] init];
            self.cityLabel.numberOfLines = 0;
            self.cityLabel.textAlignment = NSTextAlignmentCenter;
            self.cityLabel.text = [NSString stringWithFormat:@"City: %@",self.city];
            self.cityLabel.frame = CGRectMake(self.bounds.size.width/2-150, self.emailLabel.frame.origin.y+self.emailLabel.frame.size.height+20, 300, [self.cityLabel sizeThatFits:CGSizeMake(300, 100)].height);
            [self addSubview:self.cityLabel];
        }
        if (self.street && !self.streetLabel) {
            self.streetLabel = [[UILabel alloc] init];
            self.streetLabel.numberOfLines = 0;
            self.streetLabel.textAlignment = NSTextAlignmentCenter;
            self.streetLabel.text = [NSString stringWithFormat:@"Street: %@",self.street];
            self.streetLabel.frame = CGRectMake(self.bounds.size.width/2-150, self.cityLabel.frame.origin.y+self.cityLabel.frame.size.height+20, 300, [self.streetLabel sizeThatFits:CGSizeMake(300, 100)].height);
            [self addSubview:self.streetLabel];
        }
        if (self.zipcode && !self.zipcodeLabel) {
            self.zipcodeLabel = [[UILabel alloc] init];
            self.zipcodeLabel.numberOfLines = 0;
            self.zipcodeLabel.textAlignment = NSTextAlignmentCenter;
            self.zipcodeLabel.text = [NSString stringWithFormat:@"Zipcode: %@",self.zipcode];
            self.zipcodeLabel.frame = CGRectMake(self.bounds.size.width/2-150, self.streetLabel.frame.origin.y+self.streetLabel.frame.size.height+20, 300, [self.zipcodeLabel sizeThatFits:CGSizeMake(300, 100)].height);
            [self addSubview:self.zipcodeLabel];
        }
        if (self.photoUrl && !self.photoImageView) {
            self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2-150, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height+20, 300, 300)];
            [self addSubview:self.photoImageView];
            [self.photoImageView setImageWithURL:self.photoUrl placeholderImage:nil];
        }
        
    }
}

@end
