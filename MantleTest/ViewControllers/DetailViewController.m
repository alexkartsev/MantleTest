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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
