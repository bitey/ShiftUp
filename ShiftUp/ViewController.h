//
//  ViewController.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/10/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *mrLocationManager;

-(void)startUpdatingLocation;

-(void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations;

-(void)updatePersonalCoordinates:(CLLocationCoordinate2D)newCoordinate;

-(void)updateMapViewWithNewCenter:(CLLocationCoordinate2D)newCoordinate;

@end
