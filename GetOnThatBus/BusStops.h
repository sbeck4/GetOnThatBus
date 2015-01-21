//
//  BusStops.h
//  GetOnThatBus
//
//  Created by Shannon Beck on 1/20/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BusStops : NSObject

@property CLLocationCoordinate2D coordinate;
@property NSString *title;

@property NSString *name;
@property NSString *route;
@property NSString *address;
@property NSString *altRoute;
@property NSString *stopID;
@property float latitude;
@property float longitude;

@end
