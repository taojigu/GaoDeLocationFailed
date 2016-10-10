//
//  MAMapView+Util.m
//  NeighbourFriends
//
//  Created by GuJitao on 15/12/6.
//  Copyright © 2015年 gujitao. All rights reserved.
//

#import "MAMapView+Util.h"

@implementation MAMapView(Util)


-(void)clearMapView
{
    for (id<MAAnnotation> annotation in self.annotations)
    {
        if ([annotation class] == [MAUserLocation class])
        {
            continue;
        }
        
        MAAnnotationView* antView = [self viewForAnnotation:annotation];
        [antView removeFromSuperview];
    }
    
    [self removeAnnotations:self.annotations];
}

-(void)moveToSpot:(double)latitude longtitude:(double)longtitude
{
    CLLocationCoordinate2D noLocation = CLLocationCoordinate2DMake(latitude, longtitude);

    MACoordinateRegion viewRegion = MACoordinateRegionMakeWithDistance(noLocation, 2000, 2000);
    MACoordinateRegion adjustedRegion = [self regionThatFits:viewRegion];
    [self setRegion:adjustedRegion animated:NO];
    return;
    

}

@end
