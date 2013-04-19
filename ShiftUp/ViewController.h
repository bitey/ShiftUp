//
//  ViewController.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/10/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationManager.h"
#import "Event.h"

@interface ViewController : UIViewController <MKMapViewDelegate, LocationManagerDelegate>

-(void)createMapRegionAndSpanWithCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate;

-(void)createAnnotationFromEvent:(Event*)event;

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view;

@end
