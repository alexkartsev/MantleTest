//
//  TableViewController.m
//  MantleTest
//
//  Created by Alexander on 12/30/15.
//  Copyright © 2015 iTechArt. All rights reserved.
//

#import "TableViewController.h"
#import "User.h"
#import "Photo.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayOfObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        if (self.isPhotos) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        else {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
    }
    
    cell.imageView.image = nil;
    cell.textLabel.text = nil;
    cell.detailTextLabel.text = nil;
    
    if (self.isPhotos) {
        Photo *photo = [self.arrayOfObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = photo.title;
        //[cell.imageView setImageWithURL:photo.imageURL placeholderImage:nil];
        NSURLRequest *request = [NSURLRequest requestWithURL:photo.imageURL];
        __weak typeof(UITableViewCell) *weakCell = cell;
        [cell.imageView setImageWithURLRequest:request
    placeholderImage:nil
    success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
        [weakCell.imageView setImage:image];
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"ERROR of loading image");
    }];
    }
    else {
        User *user = [self.arrayOfObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = user.name;
        cell.detailTextLabel.text = user.email;
    }
    return cell;
}

@end
