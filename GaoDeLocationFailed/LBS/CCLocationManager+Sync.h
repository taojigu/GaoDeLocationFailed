//
//  CCLocationManager+Sync.h
//  Neighbours
//
//  Created by gus on 16/10/5.
//  Copyright © 2016年 gu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCLocationManager.h"

@interface CCLocationManager(Sync)


//-(CLLocationCoordinate2D)locationCoordinate;

@property(nonatomic,assign,readonly)CLLocationCoordinate2D currentCoordinate;

@end
