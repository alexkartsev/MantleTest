//
//  DetailView.m
//  MantleTest
//
//  Created by Alexander on 1/4/16.
//  Copyright © 2016 Alex Kartsev. All rights reserved.
//

#import "DetailViewForUser.h"

@interface DetailViewForUser()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UILabel *cityLabel;
@property (strong, nonatomic) UILabel *streetLabel;
@property (strong, nonatomic) UILabel *zipcodeLabel;

@end

@implementation DetailViewForUser

static CGFloat MAXWIDTH = 300.0f;

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
        
        self.emailLabel = [[UILabel alloc] init];
        self.emailLabel.numberOfLines = 0;
        self.emailLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.emailLabel];
        
        self.cityLabel = [[UILabel alloc] init];
        self.cityLabel.numberOfLines = 0;
        self.cityLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.cityLabel];
        
        self.streetLabel = [[UILabel alloc] init];
        self.streetLabel.numberOfLines = 0;
        self.streetLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.streetLabel];
        
        self.zipcodeLabel = [[UILabel alloc] init];
        self.zipcodeLabel.numberOfLines = 0;
        self.zipcodeLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.zipcodeLabel];
        
    }
    return self;
}

-(void)layoutSubviews {
    if (self.title && self.titleLabel) {
        self.titleLabel.text = self.title;
        self.titleLabel.frame = CGRectMake(self.bounds.size.width/2-MAXWIDTH/2, 150, MAXWIDTH, [self.titleLabel sizeThatFits:CGSizeMake(MAXWIDTH, 100)].height);
        
        if (self.email && self.emailLabel) {
            self.emailLabel.text = self.email;
            self.emailLabel.frame = CGRectMake(self.bounds.size.width/2-MAXWIDTH/2, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height+20, MAXWIDTH, [self.emailLabel sizeThatFits:CGSizeMake(MAXWIDTH, 100)].height);
        }
        
        if (self.city && self.cityLabel) {
            self.cityLabel.text = [NSString stringWithFormat:@"City: %@",self.city];
            self.cityLabel.frame = CGRectMake(self.bounds.size.width/2-MAXWIDTH/2, self.emailLabel.frame.origin.y+self.emailLabel.frame.size.height+20, MAXWIDTH, [self.cityLabel sizeThatFits:CGSizeMake(300, 100)].height);
        }
        if (self.street && self.streetLabel) {
            self.streetLabel.text = [NSString stringWithFormat:@"Street: %@",self.street];
            self.streetLabel.frame = CGRectMake(self.bounds.size.width/2-MAXWIDTH/2, self.cityLabel.frame.origin.y+self.cityLabel.frame.size.height+20, MAXWIDTH, [self.streetLabel sizeThatFits:CGSizeMake(MAXWIDTH, 100)].height);
        }
        if (self.zipcode && self.zipcodeLabel) {
            self.zipcodeLabel.text = [NSString stringWithFormat:@"Zipcode: %@",self.zipcode];
            self.zipcodeLabel.frame = CGRectMake(self.bounds.size.width/2-MAXWIDTH/2, self.streetLabel.frame.origin.y+self.streetLabel.frame.size.height+20, MAXWIDTH, [self.zipcodeLabel sizeThatFits:CGSizeMake(MAXWIDTH, 100)].height);
        }

        if (self.zipcodeLabel) {
            self.contentSize = CGSizeMake(self.bounds.size.width, self.zipcodeLabel.frame.origin.y+self.zipcodeLabel.frame.size.height+20);
        }
    }
}

@end
