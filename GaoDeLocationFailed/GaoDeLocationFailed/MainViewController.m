//
//  MainViewController.m
//  GaoDeLocationFailed
//
//  Created by gus on 16/10/10.
//  Copyright © 2016年 Gu. All rights reserved.
//

#import "MainViewController.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
#import <PureLayout/PureLayout.h>
#import "CCLocationManager.h"
#import "MAMapView+Util.h"
#import "CCLocationManager+Sync.h"

@interface MainViewController () <MAMapViewDelegate>

@property(strong,nonatomic)MAMapView* mapView;

@end

@implementation MainViewController


-(instancetype)init
{
    self = [super init];
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectZero];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mapView];
    //[self.mapView autoPinEdgesToSuperviewEdges];
    
    self.mapView.frame = self.view.bounds;
    
    CLLocationCoordinate2D cord = CLLocationCoordinate2DMake(39.23, 116.244);
    [self.mapView moveToSpot:cord.latitude longtitude:cord.longitude];
                                   
    
    // Do any additional setup after loading the view.
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
