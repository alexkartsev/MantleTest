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
//#import <AFNetworking.h>
//#import "UIImageView+AFNetworking.h"
#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TableViewController ()

@end

@implementation TableViewController

static NSString *cellIdentifier = @"Cell";

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        if (self.isPhotos) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        else {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        }
    }
    
    if (self.isPhotos) {
        cell.imageView.image = nil;
        Photo *photo = [self.arrayOfObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = photo.title;
        [cell.imageView sd_setImageWithURL:photo.imageURL
                          placeholderImage:nil
                                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                     [cell setNeedsLayout];
         }];
        
        
//        NSURLRequest *request = [NSURLRequest requestWithURL:photo.imageURL];
//        __weak typeof(UITableViewCell) *weakCell = cell;
//        [cell.imageView setImageWithURLRequest:request
//                              placeholderImage:nil
//                                       success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
//                                               weakCell.imageView.image = image;
//                                               [weakCell setNeedsLayout];
//        }                              failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
//                                                NSLog(@"ERROR of loading image for cell");
//        }];
    }
    else {
        User *user = [self.arrayOfObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = user.name;
        cell.detailTextLabel.text = user.email;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.imageView sd_cancelCurrentImageLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *vc = [[DetailViewController alloc] init];
    if (self.isPhotos) {
        vc.photo = [self.arrayOfObjects objectAtIndex:indexPath.row];
    }
    else {
        vc.user = [self.arrayOfObjects objectAtIndex:indexPath.row];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
