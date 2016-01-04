//
//  MainViewController.m
//  MantleTest
//
//  Created by Alexander on 12/29/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//

#import "MainViewController.h"
#import "ParseManager.h"
#import "TableViewController.h"
#import <MBProgressHUD.h>

@interface MainViewController ()

@property (strong, nonatomic) UIButton *userButton;
@property (strong, nonatomic) UIButton *photosButton;
@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.userButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 150, 100, 20)];
    [self.userButton setTitle:@"Users" forState:UIControlStateNormal];
    [self.userButton addTarget:self action:@selector(didUserButtonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.userButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [self.view addSubview:self.userButton];
    
    self.photosButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 250, 100, 20)];
    [self.photosButton setTitle:@"Photos" forState:UIControlStateNormal];
    [self.photosButton addTarget:self action:@selector(didPhotosButtonPress) forControlEvents:UIControlEventTouchUpInside];
    [self.photosButton setTitleColor:[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] forState:UIControlStateNormal];
    [self.view addSubview:self.photosButton];
    // Do any additional setup after loading the view.
}

- (void)didUserButtonPress {
    TableViewController *vc = [[TableViewController alloc] init];
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[ParseManager sharedManager] getListOfUsersWithCompletitionBlock:^(NSArray *array, NSError *error) {
        vc.arrayOfObjects = [[NSArray alloc] initWithArray:array];
        vc.isPhotos = NO;
        [self.hud hide:YES];
        self.hud = nil;
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)didPhotosButtonPress {
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    TableViewController *vc = [[TableViewController alloc] init];
    [[ParseManager sharedManager] getPhotosWithCompletitionBlock:^(NSArray *array, NSError *error) {
        vc.isPhotos = YES;
        vc.arrayOfObjects = [[NSArray alloc] initWithArray:array];
        [self.hud hide:YES];
        self.hud = nil;
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
