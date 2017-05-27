//
//  ViewController.m
//  mapView5
//
//  Created by Summer on 17/4/12.
//  Copyright © 2017年 omychic. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *destination;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)homeClick:(UIButton *)sender {
    
    CLGeocoder *coder = [CLGeocoder new];
    
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:39.9 longitude:116.4];
    [coder reverseGeocodeLocation:loc  completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        MKPlacemark *mark= [[MKPlacemark alloc] initWithPlacemark:placemarks.lastObject];
        
        MKMapItem *item = [[MKMapItem alloc] initWithPlacemark: mark];
        
        item.name = @"张海涛的窝";
        item.phoneNumber = @"+008615201333402";
        item.url = [NSURL URLWithString:@"www.piggy.com"];
        
        [item openInMapsWithLaunchOptions:nil];
    }];
    
}


- (IBAction)navClick:(UIButton *)sender {
    
    MKMapItem *source = [MKMapItem mapItemForCurrentLocation];
    
    CLGeocoder *coder = [CLGeocoder new];

    [coder geocodeAddressString:self.destination.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        MKPlacemark *mark = [[MKPlacemark alloc] initWithPlacemark:placemarks.lastObject];
        
        MKMapItem *dest = [[MKMapItem alloc] initWithPlacemark:mark];
       
        
        dest.name = @"张海涛的窝";
        dest.phoneNumber = @"+008613301333402";
        dest.url = [NSURL URLWithString:@"www.piggy.com"];

        [MKMapItem openMapsWithItems: @[source,dest] launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking, MKLaunchOptionsMapTypeKey: @(MKMapTypeStandard), MKLaunchOptionsShowsTrafficKey: @YES}];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
