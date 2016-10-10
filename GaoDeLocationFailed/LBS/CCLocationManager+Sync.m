//
//  CCLocationManager+Sync.m
//  Neighbours
//
//  Created by gus on 16/10/5.
//  Copyright © 2016年 gu. All rights reserved.
//

#import "CCLocationManager+Sync.h"
#import "CCLocationManager.h"

@implementation CCLocationManager(Sync)


-(CLLocationCoordinate2D)currentCoordinate
{
    
    CLLocationCoordinate2D cord =  CLLocationCoordinate2DMake(self.latitude, self.longitude);
    return cord;
    
}

-(CLLocationCoordinate2D)locationCoordinate
{
    
    __block CLLocationCoordinate2D cord =  self.currentCoordinate;
    
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    
    dispatch_queue_t queue = dispatch_queue_create("locateCurrentLocation", 0);
    dispatch_async(queue, ^{
        [self getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
            cord = locationCorrrdinate;
            dispatch_semaphore_signal(sema);
        }];
    });
    
    
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, (0.5 * NSEC_PER_SEC));
    dispatch_semaphore_wait(sema, delay);
    return cord;
    
}



@end
