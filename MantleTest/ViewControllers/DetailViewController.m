//
//  DetailViewController.m
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailView.h"

@interface DetailViewController ()

@property (strong, nonatomic) DetailView *detailView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailView = [[DetailView alloc] initWithFrame:self.view.bounds];
    if (self.user) {
        self.detailView.title = self.user.name;
        self.detailView.email = self.user.email;
        self.detailView.city = [self.user.address valueForKey:@"city"];
        self.detailView.zipcode = [self.user.address valueForKey:@"zipcode"];
        self.detailView.street = [self.user.address valueForKey:@"street"];
    }
    else if (self.photo) {
        self.detailView.title = self.photo.title;
        self.detailView.photoUrl = self.photo.imageURL;
    }
    [self.view addSubview:self.detailView];
//
//    self.titleLabel = [[UILabel alloc] init];
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    self.titleLabel.numberOfLines = 0;
//    if (self.user) {
//        self.titleLabel.text = self.user.name;
//    }
//    else if (self.photo) {
//        self.titleLabel.text = self.photo.title;
//    }
//    self.titleLabel.frame = CGRectMake(self.view.bounds.size.width/2-150, 150, 300, [self.titleLabel sizeThatFits:CGSizeMake(300, 100)].height);
//    [self.view addSubview:self.titleLabel];
//    if (self.user) {
//        self.emailLabel = [[UILabel alloc] init];
//        self.emailLabel.textAlignment = NSTextAlignmentCenter;
//        self.emailLabel.text = self.user.email;
//        self.emailLabel.frame = CGRectMake(self.view.bounds.size.width/2-150, self.titleLabel.frame.origin.y+self.titleLabel.frame.size.height+20, 300, [self.emailLabel sizeThatFits:CGSizeMake(300, 100)].height);
//        [self.view addSubview:self.emailLabel];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
