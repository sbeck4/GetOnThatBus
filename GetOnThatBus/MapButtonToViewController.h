//
//  MapButtonToViewController.h
//  GetOnThatBus
//
//  Created by Shannon Beck on 1/20/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "BusStops.h"

@interface MapButtonToViewController : UIViewController

@property MKAnnotationView *annotation;
@property BusStops *bussing;

@end
