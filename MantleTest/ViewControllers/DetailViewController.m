//
//  DetailViewController.m
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewForUser.h"
#import "DetailViewForPhoto.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.user) {
        DetailViewForUser *detailViewForUser = [[DetailViewForUser alloc] initWithFrame:self.view.bounds];
        detailViewForUser.title = self.user.name;
        detailViewForUser.email = self.user.email;
        detailViewForUser.city = self.user.address.city;
        detailViewForUser.zipcode = self.user.address.zipcode;
        detailViewForUser.street = self.user.address.street;
        [self.view addSubview:detailViewForUser];
    }
    else if (self.photo) {
        DetailViewForPhoto *detailViewForPhoto = [[DetailViewForPhoto alloc] initWithFrame:self.view.bounds];
        detailViewForPhoto.title = self.photo.title;
        detailViewForPhoto.photoUrl = self.photo.imageURL;
        [self.view addSubview:detailViewForPhoto];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
