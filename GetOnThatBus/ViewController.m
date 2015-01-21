//
//  ViewController.m
//  GetOnThatBus
//
//  Created by Shannon Beck on 1/20/15.
//  Copyright (c) 2015 Shannon Beck. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "BusStops.h"
#import "ListViewController.h"
#import "MapButtonToViewController.h"

@interface ViewController ()
@property NSDictionary *busStopDict;
@property NSMutableArray *busStopArray;
@property MKPointAnnotation *theAnnotation;
@property CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mapListControl;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.theAnnotation = [MKPointAnnotation new];

    [self performSetup];
    [self downloadDataFromWeb];

}


-(void)performSetup
{

    self.busStopArray = [[NSMutableArray alloc]init];

}

-(void)downloadDataFromWeb
{
    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^
     (NSURLResponse *response, NSData *data, NSError *connectionError)
     {

         [self downloadComplete:data];
         
         
     }];
}

//- (IBAction)segmenter:(id)sender
//{
//    if (self.mapListControl.selectedSegmentIndex == 0)
//    {
//        [self.mapListControl setEnabled:NO forSegmentAtIndex:0];
//    }
//}

-(void)downloadComplete:(NSData *)data
{
    self.busStopDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

    NSArray *myArray = self.busStopDict[@"row"];
    for (NSDictionary *dict in myArray)
    {
        [self unpackDictionary:dict];
    }

    [self reloadInputViews];

    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(41.87808499, -87.6329);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.4, 0.4);
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate, span);
    [self.mapView setRegion:region animated:YES];

}


-(void)unpackDictionary:(NSDictionary *)dict
{
    BusStops *bus = [BusStops new];

    bus.name = dict[@"cta_stop_name"];
    bus.route = dict[@"routes"];
    bus.address = dict[@"_address"];
    bus.altRoute = dict[@"inter_modal"];
    bus.stopID = dict[@"stop_id"];
    bus.latitude = [dict[@"latitude"] doubleValue];
    bus.longitude = [dict[@"longitude"] doubleValue];

    bus.coordinate = CLLocationCoordinate2DMake(bus.latitude, bus.longitude);
    bus.title = bus.name;

    [self.mapView addAnnotation:bus];
    [self.busStopArray addObject:bus];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    //self.theAnnotation = view.annotation;
   [self performSegueWithIdentifier:@"segue2" sender:view.annotation];
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
        BusStops *busRoute = annotation;

        if ([busRoute.altRoute isEqualToString:@"Metra"])
        {
            MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
            pin.pinColor = MKPinAnnotationColorPurple;
            pin.canShowCallout = YES;
            pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            return pin;
        }
        else if ([busRoute.altRoute isEqualToString:@"Pace"])
        {
            MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
            pin.pinColor = MKPinAnnotationColorGreen;
            pin.canShowCallout = YES;
            pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            return pin;
        }
        else
        {
            MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:nil];
            pin.canShowCallout = YES;
            pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            return pin;
        }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segue2"])
    {
        MapButtonToViewController *controller = segue.destinationViewController;
        BusStops *busRoute = [[BusStops alloc]init];
        busRoute = sender;
        controller.bussing = busRoute;
    }
    else
    {
        ListViewController *lvc = segue.destinationViewController;
        lvc.busses = self.busStopArray;
    }
}


@end
