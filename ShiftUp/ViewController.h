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

@interface ViewController : UIViewController <MKMapViewDelegate>


-(void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations;

-(void)updatePersonalCoordinates:(CLLocationCoordinate2D)newCoordinate;

-(void)updateMapViewWithNewCenter:(CLLocationCoordinate2D)newCoordinate;

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error;

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view;

@end
